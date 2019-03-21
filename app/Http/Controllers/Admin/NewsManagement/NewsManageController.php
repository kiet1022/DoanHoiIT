<?php
namespace App\Http\Controllers\Admin\NewsManagement;

use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Http\Requests\AddNewStudentRequest;
use App\Http\Requests\EditStudentRequest;
use \Carbon\Carbon;
use App\News;
use App\NewsType;
use App\User;
use App\Role;
use App\UserRole;
use App\Rules\Uppercase;

class NewsManageController extends Controller
{
    public function getNewsList(){
        $news = News::with('news')->get();
        return view('admin.news.newsList', compact('news'));
    }
}
