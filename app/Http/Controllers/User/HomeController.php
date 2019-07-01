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
use App\Models\News;
use App\Models\NewsType;
use App\Models\Activity;
class HomeController extends Controller
{
	public function getHomePage(){    
        // $news = News::where('deleted_at', null)->get();
        // $newsType = NewsType::where('deleted_at', null)->get();
        // $type_id=request('type_id');
        // $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        // if (isset($type_id)) {
        //     if ($type_id!=0) {
        //         $news = News::where('deleted_at', null)->where('type_id', $type_id)->get();
        //         return view('admin.news.newsList', compact('news','newsType','type_id', 'lastedNews'));
        //     }
        //     else{
        //         $news = News::where('deleted_at', null)->get();
        //     }
        // }

        
        // $lastedNews1 = News::where('deleted_at', null)->orderBy('id', 'desc')->first();
        // $lastedNews2 = News::where('deleted_at', null)->orderBy('id', 'desc')->skip(1)->first();
        // $lastedNews3 = News::where('deleted_at', null)->orderBy('id', 'desc')->skip(2)->first();

        // return view('user.index', compact('news','newsType','type_id', 'lastedNews','lastedNews1','lastedNews2','lastedNews3'));

        $this->data['newNews'] = News::with(['ofUser.student','ofType'])->orderBy('created_at','desc')->take(3)->get();
        $this->data['news'] = News::orderBy('created_at','desc')->inRandomOrder()->take(4)->get();
        // Get the current day
        $now = date("Y-m-d H:i:s");
        $firstDay = date('Y-m-01', strtotime($now));
        // Last day of the month.
        $lastDay = date('Y-m-t', strtotime($now));
        $this->data['activities'] = Activity::where('start_date','>=',$firstDay)->where('end_date','<=',$lastDay)->get();
        $this->data['newsType'] = NewsType::all();
        // return $this->data['newNews'];
        return view('student.index')->with($this->data);
    }
}
