<?php
use App\District;
use App\Province;
use App\Ward;
use App\User;
use Illuminate\Http\Request;
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