<?php
namespace App\Http\Controllers\Admin\StudentManagement;

use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;

use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;

/**
 * StudentManageController.php
 * Created at 15/03/2019
 * Updated at 17/03/22019
 * author Kiet-DT
 */

class StudentManageController extends Controller
{
    
    /**
    * Get Student list page
    * 
    * @return view
    */
    public function getStudentList(){
        $role = Role::where('id',config('constants.STUDENT_MANAGE_ROLE'))->first();
        $user_role = UserRole::where('user_id',Auth::user()->id)->where('role_id',$role->id)->first();
        switch ($user_role) {
            case null:
            return view('admin.layout.403');
            break;
            
            default:
            if(Gate::allows('access',[$role, $user_role])){
                $schoolYears = SchoolYear::where('type',2)->get();
                $studentList = Student::all();
                return view('admin.students.student_list',compact('schoolYears','studentList'));
            }else{
                return view('admin.layout.403');
            }
            break;
        }
        
        
        
    }
    
    /**
    * get add student page
    * 
    * @return view
    */
    public function getAddStudentList(){
        return view('admin.students.add_student',compact('schoolYears'));
    }
    
    /**
    * Add new student
    * 
    * @param Request $re
    */
    public function postAddStudentList(Request $re){
        
        $student = new Student;
        DB::beginTransaction();
        // Handling Add new Student
        $student->student_id = $re->sid;
        $student->name = $re->studentName;
        $student->sex = $re->studentSex;
        $student->birthday = date('Y-m-d H:i:s',strtotime($re->studentBirthday));
        $student->phone_no = $re->studentPhone;
        $student->address = $re->studentAddress;
        $student->province = $re->studentProvince;
        $student->district = $re->studentDistrict;
        $student->ward = $re->studentWard;
        $student->school_year_id = $re->studentShoolYear;
        $student->class_id = $re->studentClass;
        switch ($re->toggleisUnion) {
            case 'on':
            $student->is_youth_union_member = 1;
            break;
            default:
            $student->is_youth_union_member = 0;
            break;
        }
        switch ($re->toggleUnionFee) {
            case 'on':
            $student->is_payed_union_fee = 1;
            break;
            default:
            $student->is_payed_union_fee = 0;
            break;
        }
        $student->is_study = $re->isStudy;
        $student->save();
        DB::commit();
        return redirect()->back()->with('success','Thêm sinh viên thành công');
    }
}
