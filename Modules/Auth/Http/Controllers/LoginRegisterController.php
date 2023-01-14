<?php

namespace Modules\Auth\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Str;
use Modules\Auth\Entities\Otp;
use Modules\Auth\Http\Requests\LoginRegisterRequest;
use Modules\Auth\Repositories\AuthRepoEloquentInterface;
use Modules\Share\Http\Controllers\Controller;
use Modules\Share\Http\Services\Message\Email\EmailService;
use Modules\Share\Http\Services\Message\MessageService;
use Modules\Share\Http\Services\Message\SMS\SmsService;
use Modules\User\Entities\User;
use Modules\User\Repositories\UserRepoEloquentInterface;

class LoginRegisterController extends Controller
{
    public AuthRepoEloquentInterface $repo;

    /**
     * @param AuthRepoEloquentInterface $authRepoEloquent
     */
    public function __construct(AuthRepoEloquentInterface $authRepoEloquent)
    {
        $this->repo = $authRepoEloquent;
    }

    /**
     * @return Application|Factory|View
     */
    public function loginRegisterForm(): Factory|View|Application
    {
        return view('Auth::home.login-register');
    }

    /**
     * @param LoginRegisterRequest $request
     * @return RedirectResponse
     */
    public function loginRegister(LoginRegisterRequest $request, UserRepoEloquentInterface $userRepo): RedirectResponse
    {
        $inputs = $request->all();

        //check id is email or not
        if (filter_var($inputs['id'], FILTER_VALIDATE_EMAIL)) {
            $type = 1; // 1 => email
            $user = $userRepo->findByEmail($inputs['id']);
            if (empty($user)) {
                $newUser['email'] = $inputs['id'];
            }
        } //check id is mobile or not
        elseif (preg_match('/^(\+98|98|0)9\d{9}$/', $inputs['id'])) {
            $type = 0; // 0 => mobile;


            // all mobile numbers are in on format 9** *** ***
            $inputs['id'] = ltrim($inputs['id'], '0');
            $inputs['id'] = substr($inputs['id'], 0, 2) === '98' ? substr($inputs['id'], 2) : $inputs['id'];
            $inputs['id'] = str_replace('+98', '', $inputs['id']);

            $user = $userRepo->findByMobile($inputs['id']);
            if (empty($user)) {
                $newUser['mobile'] = $inputs['id'];
            }
        } else {
            $errorText = 'شناسه ورودی شما نه شماره موبایل است نه ایمیل';
            return redirect()->route('auth.customer.login-register-form')->withErrors(['id' => $errorText]);
        }

        if (empty($user)) {
            $newUser['password'] = '98355154';
            $newUser['activation'] = 1;
            $user = User::query()->create($newUser);
        }

        //create otp code
        $otpCode = rand(111111, 999999);
        $token = Str::random(60);
        $otpInputs = [
            'token' => $token,
            'user_id' => $user->id,
            'otp_code' => $otpCode,
            'login_id' => $inputs['id'],
            'type' => $type,
        ];

        Otp::query()->create($otpInputs);

        //send sms or email

        if ($type == 0) {
            //send sms
            $smsService = new SmsService();
            $smsService->setFrom(Config::get('smsConfig.otp_from'));
            $smsService->setTo(['0' . $user->mobile]);
            $smsService->setText("مجموعه آمازون \n  کد تایید : $otpCode");
            $smsService->setIsFlash(true);

            $messagesService = new MessageService($smsService);

        } elseif ($type === 1) {
            $emailService = new EmailService();
            $details = [
                'title' => 'ایمیل فعال سازی',
                'body' => "کد فعال سازی شما : $otpCode"
            ];
            $emailService->setDetails($details);
            $emailService->setFrom('noreply@example.com', 'example');
            $emailService->setSubject('کد احراز هویت');
            $emailService->setTo($inputs['id']);

            $messagesService = new MessageService($emailService);

        }

        $messagesService->send();

        return redirect()->route('auth.customer.login-confirm-form', $token);
    }


    /**
     * @param $token
     * @return Application|Factory|View|RedirectResponse
     */
    public function loginConfirmForm($token): View|Factory|RedirectResponse|Application
    {
        $otp = $this->repo->findByToken($token);
        if (empty($otp)) {
            return redirect()->route('auth.customer.login-register-form')->withErrors(['id' => 'آدرس وارد شده نامعتبر میباشد']);
        }
        return view('Auth::home.login-confirm', compact('token', 'otp'));
    }


    /**
     * @param $token
     * @param LoginRegisterRequest $request
     * @return RedirectResponse
     */
    public function loginConfirm($token, LoginRegisterRequest $request): RedirectResponse
    {
        $inputs = $request->all();

        $otp = $this->repo->findValidOtp($token);
        if (empty($otp)) {
            return redirect()->route('auth.customer.login-register-form', $token)->withErrors(['id' => 'آدرس وارد شده نامعتبر میباشد']);
        }

        //if otp not match
        if ($otp->otp_code !== $inputs['otp']) {
            return redirect()->route('auth.customer.login-confirm-form', $token)->withErrors(['otp' => 'کد وارد شده صحیح نمیباشد']);
        }

        // if everything is ok :
        $otp->update(['used' => 1]);
        $user = $otp->user()->first();
        if ($otp->type == 0 && empty($user->mobile_verified_at)) {
            $user->update(['mobile_verified_at' => Carbon::now()]);
        } elseif ($otp->type == 1 && empty($user->email_verified_at)) {
            $user->update(['email_verified_at' => Carbon::now()]);
        }
        Auth::login($user);
        return redirect()->route('customer.home');
    }


    /**
     * @param $token
     * @return RedirectResponse
     */
    public function loginResendOtp($token): RedirectResponse
    {
        $otp = $this->repo->findExpiredOtp($token);

        if (empty($otp)) {
            return redirect()->route('auth.customer.login-register-form', $token)->withErrors(['id' => 'ادرس وارد شده نامعتبر است']);
        }


        $user = $otp->user()->first();
        //create otp code
        $otpCode = rand(111111, 999999);
        $token = Str::random(60);
        $otpInputs = [
            'token' => $token,
            'user_id' => $user->id,
            'otp_code' => $otpCode,
            'login_id' => $otp->login_id,
            'type' => $otp->type,
        ];

        Otp::query()->create($otpInputs);

        //send sms or email

        if ($otp->type == 0) {
            //send sms
            $smsService = new SmsService();
            $smsService->setFrom(Config::get('sms.otp_from'));
            $smsService->setTo(['0' . $user->mobile]);
            $smsService->setText("مجموعه آمازون \n  کد تایید : $otpCode");
            $smsService->setIsFlash(true);

            $messagesService = new MessageService($smsService);

        } elseif ($otp->type === 1) {
            $emailService = new EmailService();
            $details = [
                'title' => 'ایمیل فعال سازی',
                'body' => "کد فعال سازی شما : $otpCode"
            ];
            $emailService->setDetails($details);
            $emailService->setFrom('noreply@example.com', 'example');
            $emailService->setSubject('کد احراز هویت');
            $emailService->setTo($otp->login_id);

            $messagesService = new MessageService($emailService);

        }

        $messagesService->send();

        return redirect()->route('auth.customer.login-confirm-form', $token);

    }


    /**
     * @return RedirectResponse
     */
    public function logout(): RedirectResponse
    {
        Auth::logout();
        return redirect()->route('customer.home');
    }
}
