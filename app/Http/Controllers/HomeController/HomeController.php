<?php

namespace App\Http\Controllers\HomeController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class HomeController extends Controller
{
    /**
     * Get login page
     * 
     */
    public function getLogin(){
        if(Auth::check()){
            abort(404);
        }else{
            return view('login');
        }
    }
    
    /**
     * Login handle
     * 
     */
    public function postLogin(Request $re){
        // Check if remember me is checked
        $remember = $re->has('remember') ? true: false;
        $login = $re->only('email','password');
        
        if(Auth::attempt($login,$remember)){
            return redirect()->route('get_student_list');
        }else{
            return redirect()->back()->with('error','Tên đăng nhập hoặc mật khẩu không đúng.');
        }
    }
    
    /**
     * Logout Handle
     * 
     */
    public function logout(){
        Auth::logout();
        return redirect()->route('get_login');
    }
}
