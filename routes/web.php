<?php
use App\District;
use App\Province;
use App\Ward;
use App\User;
use App\Student;
use App\ExecComm;
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
Route::get('/', 'HomeController\HomeController@getLogin')->name('get_login');
Route::post('login.php', 'HomeController\HomeController@postLogin')->name('post_login');
Route::get('logout.php','HomeController\HomeController@logout')->name('logout');
/*
|--------------------------------------------------------------------------
| Admin management Routes
|--------------------------------------------------------------------------
*/
Route::prefix('admin')->group(function(){
    
    /**
    * Student management Routing
    * 
    */
    Route::prefix('student')->group( function(){
        
        // list of student
        Route::get('student-list.php','Admin\StudentManagement\StudentManageController@getStudentList')->name('get_student_list');
        
        // add student handling
        Route::get('add-student.php','Admin\StudentManagement\StudentManageController@getAddStudentList')->name('get_add_student');
        Route::post('add','Admin\StudentManagement\StudentManageController@postAddStudentList')->name('post_add_student');
        
        // edit student handling
        Route::get('edit/{student_id}.php','Admin\StudentManagement\StudentManageController@getEditStudent')->name('get_edit_student');
        Route::post('edit/{student_id}.php','Admin\StudentManagement\StudentManageController@postEditStudent')->name('post_edit_student');
        
        // Student detail
        Route::post('detail.php','Admin\StudentManagement\StudentManageController@getStudentDetail')->name('get_student_detail');
        
        // Search Student
        Route::post('filter.php','Admin\StudentManagement\StudentManageController@postFilterStudent')->name('post_filter_student');
        
        // Import student
        Route::get('import-student.php','Admin\StudentManagement\StudentManageController@getImportStudent')->name('get_import_student');
        Route::post('import-student.php','Admin\StudentManagement\StudentManageController@postImportStudent')->name('post_import_student');
        
        // Delete Student
        Route::post('delete.php', 'Admin\StudentManagement\StudentManageController@deleteStudent')->name('delete_student');
    });
    
    /**
    * User management routing
    * 
    */
    Route::prefix('user')->group( function(){
        
        // List of users
        Route::get('user-list.php','Admin\UserManagement\UserManageController@getUserList')->name('get_user_list');
    });
    
    
    
    /**
    * News management routing
    * 
    */
    Route::prefix('news')->group(function(){
        
        /**
        * News type management routing
        * 
        */
        Route::prefix('type')->group(function(){
            
            // List of news type
            Route::get('list.php','Admin\NewsManagement\NewsTypeManageController@getNewTypesList')->name('get_news_type_list');
            
            // Add news type
            Route::get('add.php','Admin\NewsManagement\NewsTypeManageController@getAddNewType')->name('get_add_new_type');
            Route::post('add.php','Admin\NewsManagement\NewsTypeManageController@postAddNewsType')->name('post_add_news_type');
            
            // Edit news type
            Route::get('edit-type/{id}.php','Admin\NewsManagement\NewsTypeManageController@getEditNewsType')->name('get_edit_news_type');
            Route::post('edit-type/{id}.php','Admin\NewsManagement\NewsTypeManageController@postEditNewsType')->name('post_edit_news_type');
            
            // Delete news type
            Route::delete('deleteSelectedNewsType', 'Admin\NewsManagement\NewsTypeManageController@deleteAll')->name('deleteSelectedNewsType');
        });

        /**
         * News management
         * 
         */
        Route::get('news-list.php','Admin\NewsManagement\NewsManageController@getNewsList')->name('get_news_list');
        
        // Add news
        Route::get('add.php','Admin\NewsManagement\NewsManageController@getAddNew')->name('get_add_new');
        Route::post('add.php','Admin\NewsManagement\NewsManageController@postAddNew')->name('post_add_new');
        
        // Edit news
        Route::get('edit/{id}.php','Admin\NewsManagement\NewsManageController@getEditNew')->name('get_edit_new');
        Route::post('edit/{id}.php','Admin\NewsManagement\NewsManageController@postEditNew')->name('post_edit_new');
        
        // Delete news
        Route::delete('deleteSelectedNews', 'Admin\NewsManagement\NewsManageController@deleteAll')->name('deleteSelectedNews');
        
    });
    
    /**
    * School years management routing
    * 
    */
    Route::prefix('school-year')->group(function(){
        
        // School year list
        Route::get('education-program','Admin\AcademicManagement\AcademicManageController@getSchoolYearList')->name('educationProgramList');
        // Add school year
        Route::get('education-program/add','Admin\AcademicManagement\AcademicManageController@getAddNew')->name('get_add_program');
        Route::post('education-program/add','Admin\AcademicManagement\AcademicManageController@postAddNew')->name('post_add_program');
        
        // Edit school year
        Route::get('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@getEditProgram')->name('get_edit_program');
        Route::post('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@postEditProgram')->name('post_edit_program');
        
        // Delete School year
        Route::delete('education-program/delete', 'Admin\AcademicManagement\AcademicManageController@delete')->name('delete_selected_program');
    });
    
    /**
    * Classes Management
    * 
    */
    Route::prefix('classes')->group(function(){

        // List of classes
        Route::get('list.php','Admin\ClassManagement\ClassManageController@getClassList')->name('get_class_list');

        // Add new class
        Route::get('add-class.php','Admin\ClassManagement\ClassManageController@getAddClass')->name('get_add_class');
        Route::post('add-class.php','Admin\ClassManagement\ClassManageController@postAddClass')->name('post_add_class');

        // Edit class
        Route::get('edit-class/{id}.php','Admin\ClassManagement\ClassManageController@getEditClass')->name('get_edit_class');
        Route::post('edit-class/{id}.php','Admin\ClassManagement\ClassManageController@postEditClass')->name('post_edit_class');

        // Delete class
        Route::delete('delete-class.php', 'Admin\ClassManagement\ClassManageController@deleteAll')->name('delete_selected_class');
    });

    /**
     * Executive committee management
     * 
     */
    Route::prefix('exec-com')->group(function(){

        // List of executive committee
        Route::get('list.php','Admin\ExecCommManagement\ExecCommController@getExecCommList')->name('get_ec_list');
    });
});

Route::get('/test', function(){
    $ex = ExecComm::all()->first();
    $re = $ex->ofStudent->name;
    dd($re);
    
});
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
