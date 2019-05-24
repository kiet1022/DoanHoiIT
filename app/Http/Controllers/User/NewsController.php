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
use App\News;
use App\NewsType;

class NewsController extends Controller
{
	public function getNewDetail($id){   
        $news = News::find($id);
        $type_id=$news->ofType->id;
        $newsType = NewsType::where('deleted_at', null)->get();
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        $relatedPost = News::where('deleted_at', null)->where('type_id', $type_id)->limit(2)->get();
        return view('user.news.new_detail', compact('news','newsType', 'lastedNews','relatedPost'));
    }
    public function getNewsByCategory($id){  

        $news = News::where('deleted_at', null)->get();
        $newsType = NewsType::where('deleted_at', null)->get();
        $type_id=$id;
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        if (isset($type_id)) {
            if ($type_id!=0) {
                $news = News::where('deleted_at', null)->where('type_id', $type_id)->get();
                return view('user.news.category', compact('news','newsType','type_id', 'lastedNews'));
            }
            else{
                $news = News::where('deleted_at', null)->get();
            }
        }
        
        return view('user.news.category', compact('news','newsType','type_id', 'lastedNews'));
    }
}
