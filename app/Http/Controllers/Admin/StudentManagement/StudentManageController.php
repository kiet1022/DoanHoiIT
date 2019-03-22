<?php
namespace App\Http\Controllers\Admin\StudentManagement;

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
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        $role = Role::where('id',config('constants.STUDENT_MANAGE_ROLE'))->first();
        $user_role = UserRole::where('user_id',Auth::user()->id)->where('role_id',$role->id)->first();

        switch ($user_role) {
            case null:
            return view('admin.layout.403');
            break;
            
            default:
            if(Gate::allows('access',[$role, $user_role])){
                //filteration condition
                $school_year_id=request('studentShoolYear');
                $class_id=request('studentClass');

                $schoolYears = SchoolYear::where('type',2)->get();
                if (isset($school_year_id)&&isset($class_id)) {
                    $studentList = Student::where('deleted_at',null)->where('school_year_id', $school_year_id)->where('class_id',$class_id)->get();
                }else{
                    $studentList = Student::where('deleted_at',null)->get();
                }
                
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
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        return view('admin.students.add_student',compact('schoolYears'));
    }
    
    /**
    * Add new student
    * 
    * @param Request $re
    */
    public function postAddStudentList(AddNewStudentRequest $re){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        //Hieu edit
        $checkExist = Student::where('student_id',$re->sid)->first();
        if (isset($checkExist)) {
            return redirect()->back()->with('fail','MSSV đã tồn tại.');
        }else{
            $student = new Student;
            $success = false;
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
            $student->date_on_union=date('Y-m-d H:i:s',strtotime($re->unionDate));

            switch ($re->toggleisUnion) {
                case '1':
                $student->is_youth_union_member = 1;
                break;
                default:
                $student->is_youth_union_member = 0;
                break;
            }
            switch ($re->toggleUnionFee) {
                case '1':
                $student->is_payed_union_fee = 1;
                break;
                default:
                $student->is_payed_union_fee = 0;
                break;
            }
            if ($student->is_youth_union_member == 0) {
                $student->is_payed_union_fee = 0;
                $student->date_on_union=null;
            }
            $student->is_study = $re->isStudy;
            $student->save();
            $success = true;
            if($success){
                $user = new User;
                $user->email = $student->student_id.config('constants.MAIL_PATTERN');
                $user->level = 0;
                $user->password = bcrypt(config('constants.DEFAULT_PASSWORD'));
                $user->student_id = $student->student_id;
                if(Auth::check()){
                    $user->created_by = Auth::user()->id;
                }else{
                    return view('layout.403');
                }
                $user->save();
                DB::commit();
                // $new = Carbon::now()->format('Y-m-d');
                return redirect()->back()->with('success','Thêm sinh viên thành công');
            }else{
                return redirect()->back()->with('fail','Thêm sinh viên thất bại');
            }
        }

    }
    public function getEditStudent($student_id){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        $student = Student::where('student_id',$student_id)->first();
        return view('admin.students.edit_student',compact('student'));
    }
    public function postEditStudent($id, EditStudentRequest $re){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        try{ 
            $student = Student::where('student_id',$id)->first();
            // $userinfo = User::where('student_id',$id)->first();
            switch ($re->toggleisUnion) {
                case '1':
                $is_youth_union_member = 1;
                break;
                default:
                $is_youth_union_member = 0;
                break;
            }
            switch ($re->toggleUnionFee) {
                case '1':
                $is_payed_union_fee = 1;
                break;
                default:
                $is_payed_union_fee = 0;
                break;
            }
            if ($is_youth_union_member == 0) {
                $is_payed_union_fee = 0;
                $date_on_union=null;
            }
            // $userinfo=User::where('student_id',$id)->update(['level' => $re->permistion]);
            $student=Student::where('student_id',$id)->update([
            'name' => $re->studentName, 
            'sex' => $re->studentSex, 
            'birthday' => date('Y-m-d H:i:s',strtotime($re->studentBirthday)), 
            'address' => $re->studentAddress, 
            'province' => $re->studentProvince, 
            'district' => $re->studentDistrict, 
            'ward' => $re->studentWard, 
            'phone_no' => $re->studentPhone, 
            'is_youth_union_member' => $is_youth_union_member, 
            'is_payed_union_fee' => $is_payed_union_fee, 
            'is_study' => $re->isStudy, 
            'date_on_union' => date('Y-m-d H:i:s',strtotime($re->unionDate)), 
            'class_id' => $re->studentClass, 
            'school_year_id' => $re->studentShoolYear]);
            return redirect()->back()->with('success','Sửa thông tin thành công');
        }catch(Exception $ex){
            return redirect()->back()->with('error',$ex->getMessage());
        }
    }

    public function getImportStudent(){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        return view('admin.students.import_student');
    }

    public function deleteAll(Request $request){
        if (!isset(Auth::user()->id)) {
            return view('login'); //redirect to loginpage if no have session login
        }
        $ids = $request->ids;
        $student=Student::whereIn('student_id',explode(",",$ids))->update(['deleted_at' => now()]);
        $user=User::whereIn('student_id',explode(",",$ids))->update(['deleted_at' => now()]);
        return response()->json(['success'=>"Xóa sinh viên thành công"]);
    }
}
