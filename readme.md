# DoanHoiIT

After clone run below command

composer update

Then edit your .env file

CÁCH SỬ DỤNG CÁC COMMON CHUNG

# Về Layout

### Date time picker

-   CSS Import
    <link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
-   JS Import
    <script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
    <script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
-   HTML DEMO
    <div class="form-inline cm-inline-form col-md-3 offset-md-3">
    <label for="beginDate" class="col-md-4 common-label-inline">Từ ngày:</label>
    <div class="col-md-8 px-0">
    <input style="width: inherit;" id="beginDate" width="100%" class="form-control" name="beginDate" maxlength="10" value="{{ old('beginDate') }}">
    </div>
    </div>
-   JS DEMO
    \$('#beginDate').datepicker({
    format:'dd/mm/yyyy',
    language:'vi-VN',
    autoHide:true,
    inline:true,
    autoPick: true
    });

**Note:**
Truy cập [https://github.com/fengyuanchen/datepicker/blob/master/README.md] để tìm hiểu thêm.

### Block UI

-   JS import
    Nếu extend từ @extends('admin.layout.layout') thì không cần import vì đã import ở layout rồi

<script src="{{ asset('assets/js/common.js') }}"></script>

Sử dụng để khóa màn hình không cho người dùng thao tác khi thực hiện truy vấn đến cơ sở dữ liệu

-   blockUI(true) để khóa màn hình
-   blockUI(false) để bỏ khóa

### Show notify

-   JS Import
    Giống như Block UI

Sử dụng để hiển thị thông báo cho một hành động nào đó

-   showNotify(status, message);
    -- status: các trạng thái hiển thị của notify : success, error, warning
    -- message: Nội dung tin nhắn hiển thị trong notify

-   Cách trả về Json trong controller theo chuẩn chung
    return response()->json(["status"=>config('constants.SUCCESS'),"message"=>"Thành công!"]);
    return response()->json(["status"=>config('constants.ERROR'),"message"=>"Thất bại!"]);
    return response()->json(["status"=>config('constants.WARNING'),"message"=>"Cảnh báo!"]);

### Các hàm common dùng để xử lý khi render dữ liệu trong blade template

Tham khảo file để biết các hàm: app\common\commonFunction.php
cách sử dụng: {{ changeGenderForList('1') }} kết quả sẽ trả về 'Nam'

## Nếu có viết các hàm common nào để xử lý trên view thì viết trên đây nha

# Về phía back end

### Các hàm common phía back end

Hiện tại có 3 class common để xử lý chung phía back end:
DateTimeUtil để xứ lý về ngày tháng
StringUtil để xử lý về chuỗi
StudentUtil để xử lý về student

Tham khảo tại app\CommonHandle

-   Cách sử dụng:
    Tại các controller import bằng cách:
    use DateTimeUtil;
    use StringUtil;

trong các function gọi các hàm có trong các class đó bằng cách:
$beginDate = DateTimeUtil::convertToYmd($req->beginDate);

**Note:**
Nếu viết thêm Các hàm trong các class trên phải viết nó là static mới gọi được bằng ::

### Log

Dùng để lưu hoạt động của user vào DB

Cách sử dụng:
Tại header: use App\Log;

Tại các function
$oldData = "MSSV: ".$req->oldId."<br>";
$oldData .= "Chức vụ: ".$execComm->level."<br>";
$newData = "MSSV: ".$req->newId."<br>";
$newData .= "Chức vụ: ".$execComm->level."<br>";
Log::AddToLog('Cập nhật BCH', $oldData, $newData);

Trong đó:

-   $oldData là dữ liệu cũ, nếu các hành động thêm mới thì để $oldData = '';
-   \$newData là dữ liệu mới
-   Cuối mỗi dòng nội dung nhớ thêm "<br>" để khi render ra view nó xuống dòng nha

Gọi Log::AddToLog('Nội dung hoạt động, ghi gì cũng được','$oldData','$newData')

**Note:**
Nhớ gán đủ 3 param nha

### Cách bắt notify sau khi submit form

-   Tại controller
    return redirect()->back()->with(config('constants.SUCCESS'),'Thêm chương trình thành công!');
    return redirect()->back()->with(config('constants.ERROR'),'Thêm chương trình thất bại!');
-   Tại view
    @if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    showNotify('success',success);
    @endif

### Block UI khi submit form
// block UI when submit form
$(document).on('submit',"form", function(e){
   blockUI(true);
});
    _To Be Continued....LOL_
