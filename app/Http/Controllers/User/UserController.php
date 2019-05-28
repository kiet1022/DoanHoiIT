<?php
namespace App\Http\Controllers\User;
use Exception;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddProgramRequest;
use \Carbon\Carbon;
use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;
use App\Log;
use App\News;
use App\NewsType;

class UserController extends Controller
{
	public function getUserInfo(){    
		if (isset( Auth::user()->id)) {
			$id = Auth::user()->id;
			$user = User::find($id);
	        return view('user.userInfo.userProfile', compact('user'));
		}
		else{
			return view('auth.login');
		}
		
    }
    public function getEditUserInfo(){    
		if (isset( Auth::user()->id)) {
			$id = Auth::user()->id;
			$user = User::find($id);
	        return view('user.userInfo.editInfo', compact('user'));
		}
		else{
			return view('auth.login');
		}
		
    }
    public function postEditUserInfo(Request $re){    
		if (isset( Auth::user()->id)) {
			$id = Auth::user()->id;
			DB::beginTransaction();
			$user = User::find($id);
			$student_id=$user->student_id;
	        $student = Student::find($student_id);
	        // $student->name = $re->name;
	        $student->birthday = $re->studentBirthday;
	        $student->address = $re->address; 
	        // $student->province = $re->studentProvince; 
	        // $student->district = $re->studentDistrict; 
	        // $student->ward = $re->studentWard; 
	        $student->phone_no = $re->phone_number; 
	        $student->identity_card = $re->identity_card; 

	        if($re->hasFile('image')){
	        	error_log("--------hasfile-----------");
				$file = $re->file('image');
				$duoi = $file->getClientOriginalExtension();
				if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
					return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
				}
				$name = $file->getClientOriginalName();
				$image = str_random(4)."_".$name;
				while (file_exists("assets/img/students/".$image)) {
					$image = str_random(4)."_".$name;
				}
				$file->move("assets/img/students",$image);
				$student->image = $image;
			}else{
				error_log("--------noooooooooooofile-----------");
				$student->image = "";
			}

	        $student->save();
	        DB::commit();
	        return view('user.userInfo.userProfile', compact('user'));
		}
		else{
			return view('auth.login');
		}
		
    }
}
