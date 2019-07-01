<?php

namespace App\Http\Controllers\HomeController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Activity;
class HomeController extends Controller
{
    /**
     * Get login page
     * 
     */
    public function getLogin(){
        if(Auth::check()){
            // if(Auth::user()->level == 1){
            //     return redirect()->route('admin_dashboard');
            // } else if (Auth::user()->level == 0){
            //     return redirect()->route('get_home_page');
            // }
            return redirect()->route('get_home_page');
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
            return redirect()->back();
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
        return redirect()->back();
    }

    public function getAdminDashBoard(){
        // Get the current day
        $now = date("Y-m-d H:i:s");
        $firstDay = date('Y-m-01', strtotime($now));
        // Last day of the month.
        $lastDay = date('Y-m-t', strtotime($now));
        $this->data['activities'] = Activity::with(['leadBy','workflows' => 
            function($q){
                $q->select('activity_id','progress');
            }
        ])->where('start_date','>=',$firstDay)->where('end_date','<=',$lastDay)->get();
        // return $this->data['activities'];
        return view('admin.index')->with($this->data);
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
