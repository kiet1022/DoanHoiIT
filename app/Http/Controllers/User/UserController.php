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
use App\Models\SchoolYear;
use App\Models\Student;
use App\Models\User;
use App\Models\Role;
use App\Models\UserRole;
use App\Models\Log;
use App\Models\News;
use App\Models\NewsType;
use App\Models\CheckinDetail;
use DateTimeUtil;
use Illuminate\Support\Facades\Hash;
class UserController extends Controller
{
	public function getUserInfo(){
		$this->data['status'] = "info";
		return view('student.user_detail')->with($this->data);
	}

	public function postEditUserInfo(Request $re){
		// return
			DB::beginTransaction();
			$student = Student::find($re->sid);
			$student->name = $re->name;
			$student->birthday = DateTimeUtil::convertToYmd($re->birth_of_date);
			$student->address = $re->address;
			$student->phone_no = $re->phone_no; 
			$student->identity_card = $re->idcard;
			$student->sex = $re->sex;

			if($re->hasFile('image')){
				$file = $re->file('image');
				// return $file;
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
			}
			
			$student->save();
			DB::commit();
			return redirect()->back()->with(config('constants.SUCCESS'),'Cập nhật thành công!');
	}

	public function getChangePass(){
		$this->data['status'] = "changepass";
		return view('student.change_pass')->with($this->data);
	}

	public function PostChangePass(Request $re){
				$user = Auth::user();
        if(Hash::check($re->oldpass, $user->password)){
            //return $user;
            $user->password = Hash::make($re->newpass);
            $user->save();
            return redirect()->back()->with(config('constants.SUCCESS'),'Đổi mật khẩu thành công!');
        }else{
					return redirect()->back()->with(config('constants.ERROR'),'Mật khẩu cũ không đúng!');
        }
	}
}
