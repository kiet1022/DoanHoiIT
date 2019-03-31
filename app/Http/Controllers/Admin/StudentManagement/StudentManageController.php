<?php
namespace App\Http\Controllers\Admin\StudentManagement;
use Exception;
use App\Http\Controllers\Controller;
use App\Imports\ImportStudent;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\AddNewStudentRequest;
use App\Http\Requests\EditStudentRequest;
use \Carbon\Carbon;
use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;
use App\CommonHandle\StringUtil;
use App\CommonHandle\StudentUtil;

/**
* StudentManageController.php
* Created at 15/03/2019
* Updated at 17/03/22019
* author Kiet-DT
*/

class StudentManageController extends Controller
{
    protected $stringUtil;
    protected $studentUtil;
    
    public function __construct(StringUtil $common, StudentUtil $studentUtil){
        $this->stringUtil = $common;
        $this->studentUtil = $studentUtil;
        $this->middleware('auth');
    }
    /**
    * Get Student list page
    * 
    * @return view
    */
    public function getStudentList(){
        
        // delete session if exist
        session()->forget('_old_input');
        
        $role = Role::where('id',config('constants.STUDENT_MANAGE_ROLE'))->first();
        $user_role = UserRole::where('user_id',Auth::user()->id)->where('role_id',$role->id)->first();
        
        switch ($user_role) {
            case null:
            abort(403);
            break;
            
            default:
            if(Gate::allows('access',[$role, $user_role])){
                $studentList = Student::where('class_id',1)->where('deleted_at',null)->get();
                return view('admin.students.student_list',compact('studentList'));
            }else{
                abort(403);
                break;
            }
        }
    }
    
    /**
    * Filter student
    * 
    * @param $req
    * @return mixed
    */
    public function postFilterStudent(Request $req){
        
        // Init data filter
        $this->data['studentList'] = Student::where('school_year_id',$req->studentShoolYear)->where('class_id',$req->studentClass)->where('deleted_at',null);
        
        // Check filter condition and put it into query
        if(StringUtil::pureString($req->filterSid) != null){
            $this->data['studentList'] = $this->data['studentList']->where('student_id','like',$req->filterSid.'%');
        }
        if(StringUtil::pureString($req->filterName) != null){
            $this->data['studentList'] = $this->data['studentList']->where('name','like','%'.$req->filterName.'%');
        }
        if($req->filterSex != '0'){
            $this->data['studentList'] = $this->data['studentList']->where('sex',$req->filterSex);
        }
        if($req->filterAddress != '0'){
            $this->data['studentList'] = $this->data['studentList']->where('address','like','%'.$req->filterAddress.'%');
        }
        
        // Get data
        $this->data['studentList'] = $this->data['studentList']->get();
        
        // Set old value input to session
        $req->flash();
        return view('admin.students.student_list')->with($this->data);
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
    public function postAddStudentList(AddNewStudentRequest $re){
        
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
    
    /**
    * Get edit student page
    * 
    * @param $student_id Student ID
    */
    public function getEditStudent($student_id){
        
        $student = Student::where('student_id',$student_id)->first();
        return view('admin.students.edit_student',compact('student'));
    }
    
    /**
    * Edit Student handle
    * 
    * @param $id Student ID
    * @param $re EditStudentRequest
    */
    public function postEditStudent($id, EditStudentRequest $re){
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
        return view('admin.students.import_student');
    }
    
    /**
    * Import student handle
    * 
    * @param $req
    */
    public function postImportStudent(Request $req){
        try {
            if($req->hasFile('importFile')){
                $file = $req->file('importFile');
                $duoi = $file->getClientOriginalExtension();
                if($duoi != 'xls' && $duoi != 'xlsx'){
                    return redirect()->back()->with('error','Vui lòng chọn đúng định dạng file.');
                }
                $studentArray = (new ImportStudent)->toArray($file)[0];
                // skipping heading row
                unset($studentArray[0]);
                foreach ($studentArray as $studentRow) {
                    $student = new Student;
                    $user = new User;
                    DB::beginTransaction();
                    if(!is_null($studentRow['mssv'])){
                        $student->student_id = trim($studentRow['mssv']);
                        $user->student_id = trim($studentRow['mssv']);
                        $user->email = trim($studentRow['mssv']).config('constants.MAIL_PATTERN');
                        $user->password = Hash::make(trim($studentRow['mssv']));
                        $user->level = 1;
                        $user->created_by = Auth::user()->id;
                    }
                    if(!is_null($studentRow['ho_ten'])){
                        $student->name = trim($studentRow['ho_ten']);
                    }
                    if(!is_null($studentRow['ngay_sinh'])){
                        $student->birthday = Carbon::createFromFormat('d/m/Y', trim($studentRow['ngay_sinh']))->format('Y-m-d');
                    }
                    if(!is_null($studentRow['gioi_tinh'])){
                        $student->sex = StudentUtil::parseSexToInt($studentRow['gioi_tinh']);
                    }
                    if(!is_null($studentRow['ma_tt'])){
                        $student->province = trim($studentRow['ma_tt']);
                    }
                    if(!is_null($studentRow['ma_qh'])){
                        $student->district = trim($studentRow['ma_qh']);
                    }
                    if(!is_null($studentRow['nien_khoa'])){
                        $student->school_year_id = StudentUtil::parseSchoolYearToInt($studentRow['nien_khoa']);
                    }
                    if(!is_null($studentRow['lop'])){
                        $student->class_id = StudentUtil::parseClassToInt($studentRow['lop']);
                    }
                    if(!is_null($studentRow['dia_chi_day_du'])){
                        $student->address = trim($studentRow['dia_chi_day_du']);
                    }
                    if(!is_null($studentRow['sdt'])){
                        $student->phone_no = StringUtil::pureString($studentRow['sdt']);
                    }
                    if(!is_null($studentRow['cmnd'])){
                        $student->identity_card = StringUtil::pureString($studentRow['cmnd']);
                    }
                    $student->created_by = Auth::user()->id;
                    $student->save();
                    $user->save();
                    
                    DB::commit();
                }
            }else{
                return redirect()->back()->with('error','Vui lòng chọn file!');
            }
            return redirect()->back()->with('success','Import Thành công.');
        } catch (Exception $e) {
            return redirect()->back()->with('error','Import thất bại!');
        }
    }
    
    /**
    * Delete student handle
    * 
    * @param $req
    */
    public function deleteStudent(Request $req){
        foreach($req->student_id as $sid){
            $student = Student::find($sid);
            $student->delete();
        }
        return response()->json(['message'=>'Xóa thành công.']);
    }
    
    /**
    * Get detail of student
    * 
    * @param $request
    */
    public function getStudentDetail(Request $req){
        $this->data['student'] = Student::find($req->id);
        return response()->view('admin.students.modal_detail', $this->data);
    }
        
}