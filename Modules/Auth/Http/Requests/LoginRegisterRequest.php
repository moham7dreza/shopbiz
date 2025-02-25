<?php

namespace Modules\Auth\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Route;

class LoginRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        $route = Route::current();
        if ($route->getName() == 'auth.login-register') {
            return [
                'rules' => 'required',
                'id' => 'required|min:11|max:64|regex:/^[a-zA-Z0-9_.@\+]*$/',
            ];
        } elseif ($route->getName() == 'auth.login-confirm') {
            return [
                'otp' => 'required|min:6|max:6',
            ];
        } else return [];
    }


    /**
     * @return string[]
     */
    public function attributes(): array
    {
        return [
            'id' => 'ایمیل یا شماره موبایل',
            'rules' => 'شرایط و قوانین'
        ];
    }
}
