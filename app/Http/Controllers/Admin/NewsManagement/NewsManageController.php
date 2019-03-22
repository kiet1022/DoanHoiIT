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
        $news = News::where('deleted_at', null)->get();
        return view('admin.news.newsList', compact('news'));
    }
    public function getAddNew(){
    	$newsType = NewsType::where('deleted_at', null)->get();
        return view('admin.news.add_new', compact('newsType'));
    }
    public function postAddNew(Request $request){
		try{
			$news = new News;
			$news->sumary = $request->sumary;
			$news->content = $request->content_news;
			$news->title = $request->title;
			$news->type_id = intval($request->type);
			if($request->hasFile('image')){
				$file = $request->file('image');
				$duoi = $file->getClientOriginalExtension();
				if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
					return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
				}
				$name = $file->getClientOriginalName();
				$image = str_random(4)."_".$name;
				while (file_exists("images/news/".$image)) {
					$image = str_random(4)."_".$name;
				}
				$file->move("images/news",$image);
				$news->image = $image;
			}else{
				$news->image = "";
			}
			$news->save();
			return redirect()->back()->with('success','Thêm tin thành công');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Thêm tin thất bại');
		}
	}
	public function getEditNew($id){
        // $news = News::where('id',$id)->first();
        $news = News::find($id);
        $newsType = NewsType::where('deleted_at', null)->get();
        return view('admin.news.edit_new',compact('news','newsType'));
    }
    public function postEditNew($id, Request $re){
        try{
			$news = News::find($id);
			$news->type_id = $re->type;
			$news->title = $re->title;
			$news->sumary = $re->sumary;
			$news->content = $re->content_news;
			if($re->hasFile('image')){
				$file = $re->file('image');
				$duoi = $file->getClientOriginalExtension();
				if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'){
					return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
				}
				$name = $file->getClientOriginalName();
				$image = str_random(4)."_".$name;
				while (file_exists("images/news/".$image)) {
					$image = str_random(4)."_".$name;
				}
				$file->move("images/news",$image);
				$news->image = $image;
			}else{
				$news->image = "";
			}
			$news->save();
			return redirect()->back()->with('success','Lưu tin thành công');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Thêm tin thất bại');
		}
    }
}
