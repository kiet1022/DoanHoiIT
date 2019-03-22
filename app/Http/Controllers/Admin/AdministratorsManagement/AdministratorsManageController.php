<?php
namespace App\Http\Controllers\Admin\AdministratorsManagement;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddNewStudentRequest;
use App\Http\Requests\EditStudentRequest;
use \Carbon\Carbon;
use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;

class AdministratorsManageController extends Controller
{
	public function getAdminList(){
        $user = User::where('level',1)->where('deleted_at',null)->orWhere('level',2)->orWhere('level',3)->get();
        // $student = Student::where('student_id',$user->student_id)->get();

        // switch ($user_role) {
        //     case null:
        //     return view('admin.layout.403');
        //     break;
            
        //     default:
        //     if(Gate::allows('access',[$role, $user_role])){
        //         $schoolYears = SchoolYear::where('type',2)->get();
        //         $studentList = Student::all();
        //         return view('admin.administrators.executive_committee_list',compact('schoolYears','studentList'));
        //     }else{
        //         return view('admin.layout.403');
        //     }
        //     break;
        // }
        return view('admin.administrators.executive_committee_list',compact('user','listStudent'));
        
        
        
    }
}
