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

Route::get('student','Admin\StudentManagement\StudentManageController@getStudentList')->name('get_student_list');
Route::get('student/add','Admin\StudentManagement\StudentManageController@getAddStudentList')->name('get_add_student');
Route::post('student/add','Admin\StudentManagement\StudentManageController@postAddStudentList')->name('post_add_student');
Route::get('student/edit/{student_id}','Admin\StudentManagement\StudentManageController@getEditStudent')->name('get_edit_student');
Route::post('student/edit/{student_id}','Admin\StudentManagement\StudentManageController@postEditStudent')->name('post_edit_student');
Route::get('get-detail','Admin\StudentManagement\StudentManageController@getStudentDetail')->name('get_student_detail');

Route::get('user','Admin\UserManagement\UserManageController@getUserList')->name('get_user_list');
// Route::get('user-edit/{id}','Admin\UserManagement\UserManageController@getEditUser')->name('get_edit_user');
Route::get('exec-com-list','Admin\AdministratorsManagement\AdministratorsManageController@getAdminList')->name('get_ec_list');
Route::get('news/news-type-list','Admin\NewsManagement\NewsTypeManageController@getNewTypesList')->name('get_news_type_list');
Route::get('news/add-news-type','Admin\NewsManagement\NewsTypeManageController@getAddNewType')->name('get_add_new_type');
Route::post('news/add-news-type','Admin\NewsManagement\NewsTypeManageController@postAddNewsType')->name('post_add_news_type');
Route::get('news','Admin\NewsManagement\NewsManageController@getNewsList')->name('get_news_list');
Route::get('news/add','Admin\NewsManagement\NewsManageController@getAddNew')->name('get_add_new');
Route::post('news/add','Admin\NewsManagement\NewsManageController@postAddNew')->name('post_add_new');
Route::get('news/edit/{id}','Admin\NewsManagement\NewsManageController@getEditNew')->name('get_edit_new');
Route::post('news/edit/{id}','Admin\NewsManagement\NewsManageController@postEditNew')->name('post_edit_new');

Route::get('news/edit-type/{id}','Admin\NewsManagement\NewsTypeManageController@getEditNewsType')->name('get_edit_news_type');
Route::post('news/edit-type/{id}','Admin\NewsManagement\NewsTypeManageController@postEditNewsType')->name('post_edit_news_type');


Route::get('import-student','Admin\StudentManagement\StudentManageController@getImportStudent')->name('get_import_student');
Route::post('import-student','Admin\StudentManagement\StudentManageController@postImportStudent')->name('post_import_student');
// Route::post('deleteSelectedUser','Admin\StudentManagement\StudentManageController@deleteAll')->name('deleteSelectedUser');
Route::delete('deleteSelectedUser', 'Admin\StudentManagement\StudentManageController@deleteAll')->name('deleteSelectedUser');


Route::delete('news/deleteSelectedNews', 'Admin\NewsManagement\NewsManageController@deleteAll')->name('deleteSelectedNews');
Route::delete('deleteSelectedNewsType', 'Admin\NewsManagement\NewsTypeManageController@deleteAll')->name('deleteSelectedNewsType');

Route::get('education-program','Admin\AcademicManagement\AcademicManageController@getSchoolYearList')->name('educationProgramList');

Route::get('education-program/add','Admin\AcademicManagement\AcademicManageController@getAddNew')->name('get_add_program');
Route::post('education-program/add','Admin\AcademicManagement\AcademicManageController@postAddNew')->name('post_add_program');

Route::get('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@getEditProgram')->name('get_edit_program');
Route::post('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@postEditProgram')->name('post_edit_program');


Route::get('classes','Admin\ClassManagement\ClassManageController@getClassList')->name('get_class_list');
Route::get('classes/add','Admin\ClassManagement\ClassManageController@getAddClass')->name('get_add_class');
Route::post('classes/add','Admin\ClassManagement\ClassManageController@postAddClass')->name('post_add_class');

Route::get('/test', function(){
    $user = new User;
    $user->email = '15110237@student.hcmute.edu.vn';
    $user->password = bcrypt('15110237');
    
});