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
            return redirect()->route('get_student_list');
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
            return redirect()->route('admin_dashboard');
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

    public function getAdminDashBoard(){
        return view('admin.index');
    }

//     public function generateDocx()
//     {
//         $phpWord = new \PhpOffice\PhpWord\PhpWord();


//         $section = $phpWord->addSection();


//         $description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
// tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
// quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
// consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
// cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
// proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";


//         $section->addImage("http://itsolutionstuff.com/frontTheme/images/logo.png");
//         $section->addText($description);


//         $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
//         try {
//             $objWriter->save(storage_path('helloWorld.docx'));
//         } catch (Exception $e) {
//         }


//         return response()->download(storage_path('helloWorld.docx'));
//     }
}
