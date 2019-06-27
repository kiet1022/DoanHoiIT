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
         // $activity = DB::select(DB::raw('SELECT id, name, year, semester, start_regis_date, end_regis_date, start_date, end_date, content, practise_marks, social_marks, max_regis_num FROM activities'));
        // $registActivity = DB::select(DB::raw('SELECT a.id, a.name, a.year, a.semester, a.start_regis_date, a.end_regis_date, a.start_date, a.end_date, a.content, a.practise_marks,a.social_marks, a.max_regis_num, att.student_id, att.activity_id FROM activities a, attenders att WHERE att.student_id='.$user->student_id.' AND att.activity_id=a.id'));

        return view('user.activity.index', compact('activity', 'newsType', 'lastedNews', 'registActivity'));
    }
    public function getActivityInfo(Request $req)
    {
        $activity = Activity::find($req->id);
        return response()->view('user.activity.modal_activity_detail', compact('activity'));
    }
    public function registActivity(Request $req)
    {
        try {
            $activity = Activity::find($req->id);
            $user = User::find(Auth::user()->id);
            $limitRegister=$activity->max_regis_num;
            $getRegist =  Attender::where('activity_id', $req->id)->get();
            $count = $getRegist->count();
            if ($count>=$limitRegister) {
                return response()->json(["result" => "FAIL"]);
            }else{
                $attender = new Attender;
                $attender->activity_id = $req->id;
                $attender->student_id = $user->student_id;
                $attender->created_at = time();
                $attender->created_by = Auth::user()->id;
                $attender->save();
                return response()->json(["result" => "OK"]);
            }
            
        } catch (Exception $ex) {
            return response()->json(["result" => "FAIL"]);
        }
    }
}
