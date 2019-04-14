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
use Exception;

class NewsTypeManageController extends Controller
{
    public function getNewTypesList(){
        $newsType = NewsType::where('deleted_at', null)->get();
        return view('admin.news.newsTypeList', compact('newsType'));
    }
    public function getAddNewType(){
        // return view('admin.news.add_new_type');
            return response()->view('admin.news.add_new_type_modal');
    }
    public function postAddNewsType(Request $request){
        $newstype = new NewsType;
        // $success = false;
        // DB::beginTransaction();
        // // Handling add new type
        // $newstype->name =  $request->typename;
        // $newstype->created_by = Auth::user()->id;
        // $newstype->save();
        // $success = true;
        // if($success){
        //     // DB::commit();
        //     return redirect()->back()->with('success','Thêm loại tin thành công');
        // }else{
        //     return redirect()->back()->with('fail','Thêm loại tin thất bại');
        // }
        $newstype->name =  $request->typename;
        // $newstype->created_by = Auth::user()->id;
        $newstype->save();
        $success = true;
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu thông tin thành công!"]);
	}

	public function getEditNewsType($id){
        $newsType = NewsType::find($id);
        return view('admin.news.edit_news_type',compact('newsType'));
    }
    public function postEditNewsType($id, Request $re){
        try{ 
            DB::beginTransaction();
            $newsType = NewsType::find($id);

            $newsType->name = $re->typename;
            $newsType->save();
            DB::commit();
            return redirect()->back()->with('success','Sửa loại tin thành công.');
        }
        catch(Exception $ex){
            DB::rollback();
            return redirect()->back()->with('error', $ex->getMessage());
        }
    }
    public function deleteAll(Request $request){
        foreach($request->id as $sid){
            $newsType = NewsType::find($sid);
            $newsType->delete();
            $news = News::where('type_id',$sid);
            $news->delete();
        }
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa loại tin thành công!"]);
    }
}
