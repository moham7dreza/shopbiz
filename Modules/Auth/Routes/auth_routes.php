<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Modules\Auth\Http\Controllers\GoogleController;
use Modules\Auth\Http\Controllers\LoginController;
use Modules\Auth\Http\Controllers\LoginRegisterController;
use Modules\Auth\Http\Controllers\RegisterController;
use Modules\Auth\Http\Controllers\ResetController;
use Modules\Auth\Http\Controllers\VerifyController;

/*
|--------------------------------------------------------------------------
| Panel routes
|--------------------------------------------------------------------------
|
| Here you can see panel routes.
|
*/

Route::group([], static function ($router) {
    //
    Route::group(['middleware' => ['guest']], function () {
        // login
        Route::get('login', [LoginController::class, 'index'])->name('auth.login-form');
        Route::middleware('throttle:customer-login-register-limiter')
            ->post('/login', [LoginController::class, 'login'])->name('auth.login');
        // register
        Route::get('register', [RegisterController::class, 'index'])->name('auth.register-form');
        Route::middleware('throttle:customer-login-register-limiter')
            ->post('/register', [RegisterController::class, 'register'])->name('auth.register');
        // reset password

        // reset password view
        Route::get('reset-password', [ResetController::class, 'resetPasswordForm'])->name('auth.reset-password-form');
        // send email for user
        Route::post('reset-password', [ResetController::class, 'resetPassword'])->name('auth.reset-password');
        // user clicked for button in email and redirect to this page
        Route::get('verify-password', [ResetController::class, 'verifyPasswordForm'])->name('password.reset');
        // user submitted new password
        Route::post('verify-password', [ResetController::class, 'verifyPassword'])->name('password.update');

        // Socialite
        Route::get('google/redirect', [GoogleController::class, 'redirect'])->name('google.redirect');
        Route::get('google/callback', [GoogleController::class, 'callback'])->name('google.callback');
    });
    // Email Verify
    Route::get('email/verify', [VerifyController::class, 'index'])->name('auth.verify.email')->middleware('auth');
    Route::get('email/verify/{id}/{hash}', [VerifyController::class, 'verify'])->name('verification.verify')->middleware(['auth', 'signed']);
    Route::post('email/verify/resend', [VerifyController::class, 'resend'])->name('verify.resend')->middleware(['auth', 'throttle:5,1']);
    Route::get('email/verify/should', [VerifyController::class, 'shouldVerify'])->name('auth.verify.email.should')->middleware(['auth', 'throttle:5,1']);
    //
    Route::get('login-register', [LoginRegisterController::class, 'loginRegisterForm'])->name('auth.login-register-form');
    Route::middleware('throttle:customer-login-register-limiter')->post('/login-register', [LoginRegisterController::class, 'loginRegister'])->name('auth.login-register');
    //
    Route::get('login-confirm/{token}', [LoginRegisterController::class, 'loginConfirmForm'])->name('auth.login-confirm-form');
    Route::middleware('throttle:customer-login-confirm-limiter')->post('/login-confirm/{token}', [LoginRegisterController::class, 'loginConfirm'])->name('auth.login-confirm');
    Route::middleware('throttle:customer-login-resend-otp-limiter')->get('/login-resend-otp/{token}', [LoginRegisterController::class, 'loginResendOtp'])->name('auth.login-resend-otp');
    //
    Route::group(['middleware' => ['auth']], function () {
        Route::get('/logout', [LoginRegisterController::class, 'logout'])->name('auth.logout');
    });

});
