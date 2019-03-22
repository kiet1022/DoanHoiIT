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

class NewsTypeManageController extends Controller
{
    public function getNewTypesList(){
        $newsType = NewsType::where('deleted_at', null)->get();
        return view('admin.news.newsTypeList', compact('newsType'));
    }
    public function getAddNewType(){
        return view('admin.news.add_new_type');
    }
    public function postAddNewsType(Request $request){
		// $this->validate($request,[
		// 	'typename'=>'required|min:6'
		// ],[
		// 	'typename.required'=>'Bạn chưa nhập tên loại tin',
		// 	'typename.min'=>'Tên loại tin phải có ít nhất 6 ký tự',
		// ]);
		try{
			$newstype = new NewsType;
			$newstype->name = $request->typename;
			// $newstype->title = changeTitle($request->typename);
            // $newstype->creates = Auth::user()->id;
			$newstype->save();
			return redirect()->back()->with('success','Thêm loại tin thành công');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Thêm loại tin thất bại');
		}
	}

	public function getEditNewsType($id){
        // $news = News::where('id',$id)->first();
        $newsType = NewsType::find($id);
        return view('admin.news.edit_news_type',compact('newsType'));
    }
    public function postEditNewsType($id, Request $re){
        try{
			$newsType = NewsType::find($id);
			$newsType->name = $re->typename;
			// $newstype->updated_by = Auth::user()->id;
			$newsType->save();
			return redirect()->back()->with('success','Lưu tin thành công');
		}catch(Exception $ex){
			return redirect()->back()->with('error','Thêm tin thất bại');
		}
    }
}
