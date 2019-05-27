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
            Route::post('addType.php','Admin\NewsManagement\NewsTypeManageController@postAddNewsType')->name('post_add_news_type');
            
            // Edit news type
            Route::post('edit.php','Admin\NewsManagement\NewsTypeManageController@getEditNewsType')->name('get_edit_news_type');
            Route::post('saveType.php','Admin\NewsManagement\NewsTypeManageController@postEditNewsType')->name('post_edit_news_type');
            
            // Delete news type
            // Route::delete('deleteSelectedNewsType', 'Admin\NewsManagement\NewsTypeManageController@deleteAll')->name('deleteSelectedNewsType');
            Route::post('delete.php', 'Admin\NewsManagement\NewsTypeManageController@deleteAll')->name('deleteSelectedNewsType');
        });

        /**
         * News management
         * 
         */
        Route::get('news-list.php','Admin\NewsManagement\NewsManageController@getNewsList')->name('get_news_list');
        
        // Add news
        Route::get('add.php','Admin\NewsManagement\NewsManageController@getAddNew')->name('get_add_new');
        Route::post('addNew.php','Admin\NewsManagement\NewsManageController@postAddNew')->name('post_add_new');
        
        // Edit news
        Route::get('edit/{id}.php','Admin\NewsManagement\NewsManageController@getEditNew')->name('get_edit_new');
        Route::post('edit/{id}.php','Admin\NewsManagement\NewsManageController@postEditNew')->name('post_edit_new');
        
        // Delete news
        Route::post('delete.php', 'Admin\NewsManagement\NewsManageController@deleteAll')->name('deleteSelectedNews');
        
    });
    
    /**
    * School years management routing
    * 
    */
    Route::prefix('school-year')->group(function(){
        
        // School year list
        Route::get('education-program','Admin\AcademicManagement\AcademicManageController@getSchoolYearList')->name('educationProgramList');
        // Add school year
        // Route::get('education-program/add','Admin\AcademicManagement\AcademicManageController@getAddNew')->name('get_add_program');
        Route::get('education-program/add.php','Admin\AcademicManagement\AcademicManageController@getAddNew')->name('get_add_program');
        Route::post('education-program/addProgram.php','Admin\AcademicManagement\AcademicManageController@postAddNew')->name('post_add_program');
        
        // Edit school year
        // Route::get('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@getEditProgram')->name('get_edit_program');
        // Route::post('education-program/edit/{id}','Admin\AcademicManagement\AcademicManageController@postEditProgram')->name('post_edit_program');
        Route::post('education-program/edit.php','Admin\AcademicManagement\AcademicManageController@getEditProgram')->name('get_edit_program');
        Route::post('education-program/save.php','Admin\AcademicManagement\AcademicManageController@postEditProgram')->name('post_edit_program');
        // Delete School year
        Route::post('education-program/delete.php', 'Admin\AcademicManagement\AcademicManageController@delete')->name('delete_selected_program');
    });
    
    /**
    * Classes Management
    * 
    */
    Route::prefix('classes')->group(function(){

        // List of classes
        Route::get('list.php','Admin\ClassManagement\ClassManageController@getClassList')->name('get_class_list');

        // Add new class
        Route::get('add.php','Admin\ClassManagement\ClassManageController@getAddClass')->name('get_add_class');
        Route::post('add-class.php','Admin\ClassManagement\ClassManageController@postAddClass')->name('post_add_class');

        // Edit class
        Route::post('edit-class.php','Admin\ClassManagement\ClassManageController@getEditClass')->name('get_edit_class');
        Route::post('save-class.php','Admin\ClassManagement\ClassManageController@postEditClass')->name('post_edit_class');

        // Delete class
        Route::post('delete.php', 'Admin\ClassManagement\ClassManageController@delete')->name('delete_selected_class');
    });

    /**
     * Executive committee management
     * 
     */
    Route::prefix('exec-com')->group(function(){

        // List of executive committee
        Route::get('list.php','Admin\ExecCommManagement\ExecCommController@getExecCommList')->name('get_ec_list');

        // Exec Comm Chart
        Route::get('chart/type={type}.php','Admin\ExecCommManagement\ExecCommController@getExecCommChart')->name('get_ec_chart');

        // get edit exec comm
        Route::post('edit.php','Admin\ExecCommManagement\ExecCommController@getExecCommDetail')->name('get_exec_edit');

        // Check info
        Route::post('check.php','Admin\ExecCommManagement\ExecCommController@checkInfo')->name('check_info');

        // Save exec Comm info
        Route::post('save-info.php','Admin\ExecCommManagement\ExecCommController@saveInfo')->name('save-info');
    });

    /**
     * Logs management
     * 
     */
    Route::prefix('activities')->group(function(){

        // Show logs page
        Route::get('logs.php','Admin\ActivityManagement\LogController@getActivityLog')->name('get_logs');

        // filter log
        Route::post('filtered.php','Admin\ActivityManagement\LogController@filterActivityLog')->name('filter_logs');
        
        // Get add activity page
        Route::get('add.php','Admin\ActivityManagement\ActivityController@getAddActivity')->name('get_add_activity');

        // Post add new activity
        Route::post('add.php','Admin\ActivityManagement\ActivityController@postAddActivity')->name('post_add_activity');

        // get Activity list
        Route::get('list.php','Admin\ActivityManagement\ActivityController@getListActivity')->name('get_list_activity');

        //get Activity detail
        Route::post('detail.php','Admin\ActivityManagement\ActivityController@activityDetail')->name('get_activity_detail');

        // Filter Activity
        Route::post('filter.php','Admin\ActivityManagement\ActivityController@filterActivity')->name('filter_activity');

        // Get edit activity page
        Route::get('edit/{id}-activity.php','Admin\ActivityManagement\ActivityController@getEditActivity')->name('get_edit_activity');

        // Post edit activity
        Route::post('edit/{id}-activity.php','Admin\ActivityManagement\ActivityController@postEditActivity')->name('post_edit_activity');

        // Delete activity
        Route::post('delete.php', 'Admin\ActivityManagement\ActivityController@deleteActivity')->name('delete_activity');

        // get Checkin page
        Route::get('check-in.php','Admin\ActivityManagement\ActivityController@getCheckin')->name('get_check_in');

        // Save check-in list
        Route::post('check-in/save.php','Admin\ActivityManagement\ActivityController@saveCheckin')->name('save_check_in');


        Route::prefix('funding')->group(function(){

            // add activity funding
            Route::get('add/{id}.php','Admin\ActivityManagement\ActivityController@getAddActivityFund')->name('get_add_activity_funding');

            // add activity handle
            Route::post('add.php','Admin\ActivityManagement\ActivityController@postAddActivityFund')->name('post_add_activity_funding');

            // Get edit activity funding
            Route::get('edit/{id}.php','Admin\ActivityManagement\ActivityController@getEditActivityFund')->name('get_edit_activity_funding');

            // Post edit activity funding
            Route::post('edit/{id}.php','Admin\ActivityManagement\ActivityController@postEditActivityFund')->name('post_edit_activity_funding');

            // Ajax load activity by year and semester
            Route::post('load-activities.php','Admin\ActivityManagement\ActivityController@loadActivity')->name('load_activity');

            // Delete all activity funding detail
            Route::post('delete-activity-funding.php','Admin\ActivityManagement\ActivityController@deleteActivityFunding')->name('delete_activity_funding');
        });
    });

    /**
     * Trash of system management
     * 
     */
    Route::prefix('trash')->group(function(){

        // Trash bin
        Route::get('list.php','Admin\TrashManagement\TrashController@getTrashBin')->name('trash_bin');

        // Change Trash type
        Route::post('type.php','Admin\TrashManagement\TrashController@changeTrashType')->name('trash_type');

        // Restore the trash
        Route::post('restore.php','Admin\TrashManagement\TrashController@restoreTrash')->name('restore_trash');
    });

    /**
     * Marks management
     * 
     */
    Route::prefix('marks')->group(function(){

        Route::get('list.php','Admin\MarksManagement\MarksController@getMarksList')->name('get_marks_list');
    });
});

Route::get('/test', function(){
    // $student = new Student;
    // $student->student_id = "16110294";
    // $student->name = "Nguyễn Thị Kim Dung";
    // $student->class_id = 7;
    // $student->school_year_id = 2;
    // $student->birthday = "1998-09-22";
    // $student->save();
    // $user = new User;
    // $user->student_id = $student->student_id;
    // $user->email = $student->student_id."@student.hcmute.edu.vn";
    // $user->password = bcrypt($student->student_id);
    // $user->save();
    
});
/*
|--------------------------------------------------------------------------
| User management Routes
|--------------------------------------------------------------------------
*/
Route::get('/index', 'User\HomeController@getHomePage')->name('get_home_page');
Route::get('/new/{id}.php', 'User\NewsController@getNewDetail')->name('get_new');
Route::get('/category/{id}.php', 'User\NewsController@getNewsByCategory')->name('get_new_by_ctg');
Route::get('/infomation.php', 'User\UserController@getUserInfo')->name('get_profile');
Route::get('/editInfomation.php', 'User\UserController@getEditUserInfo')->name('get_edit_info');
Route::post('/updateInfomation.php', 'User\UserController@postEditUserInfo')->name('post_edit_info');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('testt', function(){
    //$a = '';
    //return StringUtil::pureString($a);
});