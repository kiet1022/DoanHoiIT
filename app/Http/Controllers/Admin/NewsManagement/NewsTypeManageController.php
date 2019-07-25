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

class NewsTypeManageController extends Controller
{
    public function getNewTypesList(Request $req){
        // Check user role
        $newsType = NewsType::all();
        return view('admin.news.newsTypeList', compact('newsType'));
    }

    public function getAddNewType(Request $req){
        // Check user role
        // return view('admin.news.add_new_type');
            return response()->view('admin.news.add_new_type_modal');
    }
    public function postAddNewsType(Request $request){
        // Check user role
		// $request->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
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
        $newstype->created_by = Auth::user()->id;
        $newstype->save();
        // Create Log
        $oldData = " ";
        $newData = "Type: ".$request->typename."<br>";
        Log::AddToLog('Thêm loại tin',$oldData,$newData);
        $success = true;
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Lưu thông tin thành công!"]);
	}

	public function getEditNewsType(Request $req){
        // Check user role
        $newsType = NewsType::find($req->id);
        return response()->view('admin.news.edit_new_type_modal',compact('newsType'));
        // return response()->view('admin.news.edit_new_type_modal', $newsType);
    }
    public function postEditNewsType( Request $re){
        // Check user role
        try{ 
            DB::beginTransaction();
            $newsType = NewsType::find($re->id);

            // Create Log
            $oldData = "Old Type: ".$newsType->name. "";
            $newData = "New Type: ".$re->typename."<br>";
            Log::AddToLog('Chỉnh sửa loại tin',$oldData,$newData);

            $newsType->name = $re->typename;
            $newsType->save();
            DB::commit();
            return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Sửa thông tin thành công!"]);
        }
        catch(Exception $ex){
            DB::rollback();
            return redirect()->back()->with('error', $ex->getMessage());
        }
    }

    public function deleteAll(Request $request){
        // Check user role
		// $request->user()->authorizeRoles([config('constants.FULL_ROLES'), config('constants.NEWS_MANAGE_ROLE')]);
        $deleteType = "Xóa loại tin: ";
        foreach($request->id as $sid){
            $newsType = NewsType::find($sid);
            $newsType->updated_by = Auth::user()->id;
            $newsType->updated_at = time();
            $newsType->save();
            $newsType->delete();
            $news = News::where('type_id',$sid)->get();
            foreach ($news as $new) {
                $new->updated_by = Auth::user()->id;
                $new->updated_at = time();
                $new->save();
                $new->delete();
            }
            // Create Log
            $oldData = "";
            $deleteType .= "".$sid.", ";
            
        }
        Log::AddToLog('Xóa loại tin',$oldData,$deleteType);
        return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Xóa loại tin thành công!"]);
    }
}
