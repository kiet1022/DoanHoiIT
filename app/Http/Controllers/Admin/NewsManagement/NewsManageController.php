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
use App\Models\News;
use App\Models\NewsType;
use App\Models\User;
use App\Models\Role;
use App\Models\UserRole;
use App\Rules\Uppercase;
use Exception;
use App\Models\Log;
class NewsManageController extends Controller
{
	public function getNewsList(Request $req){
		// Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
		$news = News::all();
		$newsType = NewsType::all();
		$type_id=request('type_id');
		if (isset($type_id)) {
			if ($type_id!=0) {
				$news = News::where('type_id', $type_id)->get();
				return view('admin.news.newsList', compact('news','newsType','type_id'));
			}
			else{
				$news = News::all();
			}
		}
		return view('admin.news.newsList', compact('news','newsType','type_id'));
	}

	public function getAddNew(Request $req){
		// Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
		$newsType = NewsType::all();
		return view('admin.news.add_new', compact('newsType'));
	}

	public function postAddNew(Request $request){
		// Check user role
		$request->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
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
		$news->created_by = Auth::user()->id;
		$news->save();
		// Create Log
		$newData = "Type id: ".intval($request->type)."<br>
		Title: ".$request->title."<br>
		Sumary: ".$request->sumary."<br>
		Content: ".$request->content."";
		Log::AddToLog('Thêm bài viết', "", $newData);
		$success = true;
		// return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Thêm tin thành công"]);
		return redirect()->back()->with('success','Thêm tin thành công');
	}

	public function getEditNew($id, Request $req){
		// Check user role
		$req->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
		// $news = News::where('id',$id)->first();
		$news = News::find($id);
		$newsType = NewsType::all();
		return view('admin.news.edit_new',compact('news','newsType'));
	}

	public function postEditNew($id, Request $re){
		// Check user role
		$re->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
		try{
			$news = News::find($id);
			// Create Log
			$oldData = "Old type_id: ".$news->type_id."<br>
			Old Title: ".$news->title."<br>
			Old sumary: ".$news->sumary."<br>
			Old content: ".$news->content."";
			$newData = "New type_id: ".$re->type."<br>
			New Title: ".$re->title."<br>
			New sumary: ".$re->sumary."<br>
			New content: ".$re->content."";
			
			$news->type_id = $re->type;
			$news->title = $re->title;
			$news->sumary = $re->sumary;
			$news->content = $re->content_news;
			if($re->hasFile('image')){
				$file = $re->file('image');
				$duoi = $file->getClientOriginalExtension();
				// if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'jpeg'&& $duoi != 'JPG'){
					// 	return redirect()->back()->with('error','Vui lòng chọn đúng định dạng hình');
					// }
					$name = $file->getClientOriginalName();
					$image = str_random(4)."_".$name;
					while (file_exists("images/news/".$image)) {
						$image = str_random(4)."_".$name;
					}
					$file->move("images/news",$image);
					$news->image = $image;
				}else if($re->imgDelF==1){
					$news->image = "";
					error_log("---------------------");
				}else{
					error_log("++++++++++++++++++++");}
					$news->updated_at = time();
					$news->updated_by = Auth::user()->id;
					$news->save();
					Log::AddToLog('Chỉnh sửa bài viết', $oldData, $newData);
					
					return redirect()->back()->with('success','Lưu tin thành công');
				}catch(Exception $ex){
					return redirect()->back()->with('error','Thêm tin thất bại');
				}
			}
			public function deleteAll(Request $request){
				$deleteNew = "Xóa tin: ";
				foreach($request->id as $sid){
					$news = News::find($sid);
					$news->updated_by = Auth::user()->id;
					$news->updated_at = time();
					$news->save();
					$news->delete();
					// Create Log
					$deleteNew .= "".$sid.", ";
				}
				Log::AddToLog('Xóa tin', "", $deleteNew);
				return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa bài viết thành công!"]);
				
			}
		}
		