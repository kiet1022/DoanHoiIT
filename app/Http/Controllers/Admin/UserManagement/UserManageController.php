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
use App\Models\SchoolYear;
// use App\Models\Student;
use App\Models\User;
use App\Models\Student;
use App\Models\Role;
use App\Models\UserRole;
use App\Rules\Uppercase;

class UserManageController extends Controller
{

	public function __construct()
	{
			$this->middleware('auth');
	}

    public function getUserList(Request $req){
			$req->user()->authorizeRoles(['Quản lý sinh viên']);
			$schoolYears = SchoolYear::where('type',2)->get();
      $studentList = User::where('deleted_at',null)->get();
      return view('admin.user.user_list',compact('schoolYears','studentList'));
    }

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
	
	public function getRolesList(Request $req){
		$req->user()->authorizeRoles(['Quản lý Sinh viên']);
		$this->data['roles'] = Role::all();
		return view('admin.user.roles_list')->with($this->data);
	}

	public function editRole(Request $req){
		try {
			DB::beginTransaction();
			$role = Role::find($req->id);
			$role->name = $req->name;
			$role->description = $req->description;
			$role->updated_by = Auth::user()->id;
			$role->save();
			DB::commit();
			return redirect()->back()->with(config('constants.SUCCESS'),'Chỉnh sửa quyền thành công!');
		} catch (Exception $ex) {
			DB::rollback();
			return redirect()->back()->with(config('constants.ERROR'),'Chỉnh sửa quyền thất bại!');
		}
	}

	public function addRole(Request $req){
		try {
			DB::beginTransaction();
			$role = new Role;
			$role->name = $req->name;
			$role->description = $req->description;
			$role->created_by = Auth::user()->id;
			$role->save();
			DB::commit();
			return redirect()->back()->with(config('constants.SUCCESS'),'Thêm quyền thành công!');
		} catch (Exception $ex) {
			DB::rollback();
			return redirect()->back()->with(config('constants.ERROR'),'Thêm quyền thất bại!');
		}
	}

	public function getAttachRoles($userid){
		$this->data['user'] = User::where('id',$userid)->with(['student'])->first();
		// return $this->data['students'];
		$this->data['roles'] = Role::all();
		$ownRoles = UserRole::where('user_id',$userid)->select('role_id')->get();
		$this->data['ownRoles'] = [];
		foreach ($ownRoles as $role) {
			array_push($this->data['ownRoles'],$role->role_id);
		}
		// return dd($this->data['ownRoles']);
		return view('admin.user.attach_roles')->with($this->data);
	}

	public function postAttachRole(Request $req){
		$user = User::find($req->iduser);
		// Get all current user roles
		$current_roles = UserRole::where('user_id',$req->iduser)->get();
		foreach ($current_roles as $crrole) {
			$role = Role::find($crrole);
			$user->roles()->detach($role);
		}
		
		if($req->role_id != null){
			foreach ($req->role_id as $new_role) {
				$role = Role::find($new_role);
				$user->roles()->attach($role);
			}
		} else {
				$role = Role::find(10);
				$user->roles()->attach($role);
		}
		return $user::with('roles')->where('id',$req->iduser)->get();
	}
}
