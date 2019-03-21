<?php
use App\District;
use App\Province;
use App\Ward;
use App\User;
use App\Student;
use Illuminate\Http\Request;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;
use \Carbon\Carbon;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Auth::routes();
Route::get('/', function(){
    return view('login');
});
Route::post('/t', function (Request $re) {
   //return $re->email;
   if(Auth::attempt(['email'=>$re->email,'password'=>$re->password])){
       echo 'Đã đăng nhập';
   }else{
       echo 'Thất bại';
   }

    //dd($dist);
})->name('post_login');


Route::get('/hello', function(){
    return view('admin.students.student_list');
});

Route::get('student-list','Admin\StudentManagement\StudentManageController@getStudentList')->name('get_student_list');
Route::get('add-student','Admin\StudentManagement\StudentManageController@getAddStudentList')->name('get_add_student');
Route::post('add-student','Admin\StudentManagement\StudentManageController@postAddStudentList')->name('post_add_student');
Route::get('edit-student/{student_id}','Admin\StudentManagement\StudentManageController@getEditStudent')->name('get_edit_student');
Route::post('edit-student/{student_id}','Admin\StudentManagement\StudentManageController@postEditStudent')->name('post_edit_student');

Route::get('user-list','Admin\UserManagement\UserManageController@getUserList')->name('get_user_list');
// Route::get('user-edit/{id}','Admin\UserManagement\UserManageController@getEditUser')->name('get_edit_user');
Route::get('exec-com-list','Admin\AdministratorsManagement\AdministratorsManagementController@getAdminList')->name('get_ec_list');
Route::get('news/news-type-list','Admin\NewsManagement\NewsTypeManageController@getNewTypesList')->name('get_news_type_list');
Route::get('news/add-news-type','Admin\NewsManagement\NewsTypeManageController@getAddNewType')->name('get_add_new_type');
Route::post('news/add-news-type','Admin\NewsManagement\NewsTypeManageController@postAddNewsType')->name('post_add_news_type');

Route::get('import-student','Admin\StudentManagement\StudentManageController@getImportStudent')->name('get_import_student');

// Route::post('deleteSelectedUser','Admin\StudentManagement\StudentManageController@deleteAll')->name('deleteSelectedUser');
Route::delete('deleteSelectedUser', 'Admin\StudentManagement\StudentManageController@deleteAll')->name('deleteSelectedUser');
// Route::get('/session', function(){
//     session(['kiet'=>'dep trai']);

//     $value;
// });

Route::get('/test', function(){
    $student = Student::find('15110370');
    dd($student);
});