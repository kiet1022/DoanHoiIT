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

class HomeController extends Controller
{
	public function getHomePage(){    
        $news = News::where('deleted_at', null)->get();
        $newsType = NewsType::where('deleted_at', null)->get();
        $type_id=request('type_id');
        $lastedNews = News::where('deleted_at', null)->orderBy('id', 'desc')->limit(4)->get();
        if (isset($type_id)) {
            if ($type_id!=0) {
                $news = News::where('deleted_at', null)->where('type_id', $type_id)->get();
                return view('admin.news.newsList', compact('news','newsType','type_id', 'lastedNews'));
            }
            else{
                $news = News::where('deleted_at', null)->get();
            }
        }

        
        $lastedNews1 = News::where('deleted_at', null)->orderBy('id', 'desc')->first();
        $lastedNews2 = News::where('deleted_at', null)->orderBy('id', 'desc')->skip(1)->first();
        $lastedNews3 = News::where('deleted_at', null)->orderBy('id', 'desc')->skip(2)->first();

        return view('user.index', compact('news','newsType','type_id', 'lastedNews','lastedNews1','lastedNews2','lastedNews3'));
    }
}
