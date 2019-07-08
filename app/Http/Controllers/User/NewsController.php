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

class NewsController extends Controller
{
	public function getNewDetail($id){   
        $this->data['detail'] = News::find($id);
        // $type_id=$news->ofType->id;
        $this->data['newsType'] = NewsType::all();
        // $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        $this->data['relatedPost'] = News::with(['ofType'])->where('type_id', $this->data['detail']->ofType->id)->inRandomOrder()->take(5)->get();
        // return view('user.news.new_detail', compact('news','newsType', 'lastedNews','relatedPost'));
        // return $this->data['detail'];
        return view('student.news-detail')->with($this->data);
    }
    public function getNewsByCategory($id){  

        $news = News::where('deleted_at', null)->get();
        $newsType = NewsType::where('deleted_at', null)->get();
        $type_id=$id;
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        if (isset($type_id)) {
            if ($type_id!=0) {
                $news = News::where('deleted_at', null)->where('type_id', $type_id)->get();
                return view('student.category', compact('news','newsType','type_id', 'lastedNews'));
            }
            else{
                $news = News::where('deleted_at', null)->get();
            }
        }
        
        return view('student.category', compact('news','newsType','type_id', 'lastedNews'));
    }
}
