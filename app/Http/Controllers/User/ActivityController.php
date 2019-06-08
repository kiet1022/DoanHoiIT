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
use App\SchoolYear;
use App\Student;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;
use App\Log;
use App\Activity;
use App\NewsType;
use App\News;
use App\Attender;

class ActivityController extends Controller
{
    public function getListActivity()
    {
        $user = User::find(Auth::user()->id);
        $activity = Activity::where('deleted_at', null)->get();
        $newsType = NewsType::where('deleted_at', null)->get();
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        $registActivity = Attender::where('student_id', $user->student_id)->get();
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
            $user = User::find(Auth::user()->id);
            $attender = new Attender;
            $attender->activity_id = $req->id;
            $attender->student_id = $user->student_id;
            $attender->created_at = time();
            $attender->created_by = Auth::user()->id;
            $attender->save();
            return response()->json(["result" => "OK"]);
        } catch (Exception $ex) {
            return response()->json(["result" => "FAIL"]);
        }
    }
}
