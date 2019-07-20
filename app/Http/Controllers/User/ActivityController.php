<?php
namespace App\Http\Controllers\User;

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
use App\Models\Activity;
use App\Models\NewsType;
use App\Models\News;
use App\Models\Attender;
use DateTimeUtil;
class ActivityController extends Controller
{
    public function getListActivity()
    {
        $user = User::find(Auth::user()->id);
        $activity = Activity::where('deleted_at', null)->get();
        $newsType = NewsType::where('deleted_at', null)->get();
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        $registActivity = Attender::where('student_id', $user->student_id)->get();
        
        $activity_type=request('activity-type');
        if (isset($activity_type)) {
            if ($activity_type==1) {
                //show regist activity
            }
        }
        // $activity = DB::select(DB::raw('SELECT id, name, year, semester, start_regis_date, end_regis_date, start_date, end_date, content, practise_marks, social_marks, register_number FROM activities'));
        // $registActivity = DB::select(DB::raw('SELECT a.id, a.name, a.year, a.semester, a.start_regis_date, a.end_regis_date, a.start_date, a.end_date, a.content, a.practise_marks,a.social_marks, a.register_number, att.student_id, att.activity_id FROM activities a, attenders att WHERE att.student_id='.$user->student_id.' AND att.activity_id=a.id'));
        
        return view('user.activity.index', compact('activity', 'newsType', 'lastedNews', 'registActivity'));
    }
    
    public function getActivityInfo(Request $req)
    {
        $this->data['activity'] = Activity::find($req->id);
        if (Auth::check()){
            $this->data['isAttend'] = $req->user()->student->isAttend($req->id, Auth::user()->student->student_id);
        }
        // Get the current day
        $now = DateTimeUtil::getCurrentStringMonth();
        $firstDay = DateTimeUtil::getFirstDayByGivenMonthInYmd($now);
        $lastDay = DateTimeUtil::getLastDayByGivenMonthInYmd($now);

        $this->data['activities'] = Activity::where('start_date','>=',$firstDay)->where('end_date','<=',$lastDay)->get();
        return view('student.activity_detail')->with($this->data);
    }
    
    public function attendActivity(Request $req){
        $attender = new Attender;
        $attender->activity_id = $req->activity_id;
        $attender->student_id = Auth::user()->student->student_id;
        $attender->save();
        
        $activity = Activity::find($req->activity_id);
        $activity->register_number ++;
        $activity->save();
        
        return redirect()->back()->with(config('constants.SUCCESS'),'Đăng ký thành công!');
    }
    
    public function cancelRegisActivity(Request $req){
        $attender = Attender::where('activity_id',$req->activity_id)->where('student_id',Auth::user()->student->student_id)->get();
        foreach ($attender as $at) {
            $at->delete();
        }
        $activity = Activity::find($req->activity_id);
        $activity->register_number --;
        $activity->save();
        return redirect()->back()->with(config('constants.SUCCESS'),'Hủy đăng ký thành công!');
    }
    
    public function getRegistedActivity(){
        $this->data['status'] = "registedac";
        $this->data['attended'] = Attender::with(['ofActivity' => function($q){
            $q->withTrashed();
        }])->where('student_id',Auth::user()->student->student_id)->get();
        // return $this->data['attended'];
        return view('student.registerd_activity')->with($this->data);
    }
}
