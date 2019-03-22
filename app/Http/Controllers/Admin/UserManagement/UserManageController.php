<?php

namespace App\Http\Controllers\Admin\UserManagement;
use App\Http\Controllers\Controller;
// use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddNewStudentRequest;
use \Carbon\Carbon;
use App\SchoolYear;
// use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;

class UserManageController extends Controller
{
    public function getUserList(){
        $role = Role::where('id',config('constants.STUDENT_MANAGE_ROLE'))->first();
        $user_role = UserRole::where('user_id',Auth::user()->id)->where('role_id',$role->id)->first();
        switch ($user_role) {
            case null:
            return view('admin.layout.403');
            break;
            
            default:
            if(Gate::allows('access',[$role, $user_role])){
                $schoolYears = SchoolYear::where('type',2)->get();
                $studentList = User::where('deleted_at',null)->get();
                return view('admin.user.user_list',compact('schoolYears','studentList'));
            }else{
                return view('admin.layout.403');
            }
            break;
        }
    }
 //    public function getEditUser($student_id){
	// 	$user = User::find($student_id);
	// 	error_log($user);
	// 	return view('admin.user.edit_user',compact('user'));
	// }
    public function addUser(AddUserRequest $request){
		try{
			$user = new User;
         // $user->username = $request->email;
			$user->email = $request->email;
			$user->level = $request->level;
			$user->password = bcrypt('123456');
			$user->updated_by = Auth::user()->id;
			$user->save();
			$userinfo = new UserInfo;
			$userinfo->id_user = $user->id;
         	$userinfo->name = $request->name;
			$userinfo->save();
			return redirect()->back()->with('success','Thêm tài khoản thành công. Mật khẩu là 123456');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Tài khoản đã tồn tại, vui lòng nhập địa chỉ email khác');
		}
	}
	public function deleteUser($id){
		try{
			$user = User::find($id);
          // $userinfo = UserInfo::where('id_user',$id);
          // $userinfo->delete();
          // $user->delete();
			$user->status=1;
			$user->updated_at=now();
			$user->updated_by = Auth::user()->id;
			$user->save();
			return redirect()->back()->with('success','Xóa thành công');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Xóa Thất bại');
		}
	}
	
}
