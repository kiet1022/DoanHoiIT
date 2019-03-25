@extends('admin.layout.layout')
@section('title')
Thêm chi đoàn
@endsection
@section('style')
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/vendor/icheck-1.x/skins/flat/green.css')}}" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link href="{{asset('assets/vendor/gijgo-combined-1.9.11/css/gijgo.min.css')}}" rel="stylesheet">
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Thêm chi đoàn</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_add_class') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="type" class="form-control col-md-2" name="type">
                                    <option value="2">2 năm</option>
                                    <option value="4">4 năm</option>
                                </select>
                            </div> 
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Thời gian đào tạo <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="start" class="form-control col-md-2" name="start">
                                    @for ($i =2000; $i <= 2050; $i++)
                                    <option value="{{$i}}" @if( date('Y') ==$i) {{"selected"}} @endif>{{ $i }}</option>
                                    @endfor  
                                </select>
                                <label class="col-md-1">  -  </label>
                                <select id="end" class="form-control col-md-2" name="end">
                                    <option value="" >--</option>
                                </select>
                            </div>
                            <div class="form-inline cm-inline-form">
                                <label for="name" class="col-md-2 common-label-inline">Tên chi đoàn <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="name" name="name" placeholder="" required value="{{old('name')}}">
                            </div>     
                        </div>
                    </div>
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="button" class="btn btn-secondary cm-btn-form" onclick="javascript:history.back()">Cancel</button>
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
            </div>
        </form>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/vendor/icheck-1.x/icheck.js')}}"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="{{asset('assets/vendor/gijgo-combined-1.9.11/js/gijgo.js')}}"></script>
<script src="{{asset('assets/js/ckeditor/ckeditor.js')}}"></script>
<script type="text/javascript">
    var val = $("#type option:selected").val();
    var start = $("#start option:selected").val();
    var yearEnd=parseInt(start)+parseInt(val);
    var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
    $("#end").html(str);
    $('#start').change(function() {
        var val = $("#type option:selected").val();
        var start = $("#start option:selected").val();
        var yearEnd=parseInt(start)+parseInt(val);
        var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
        $("#end").html(str);
    });
    $('#type').change(function() {
        var val = $("#type option:selected").val();
        var start = $("#start option:selected").val();
        var yearEnd=parseInt(start)+parseInt(val);
        var str='<option value='+yearEnd+' >'+yearEnd+'</option>';
        $("#end").html(str);
    });
</script>

@endsection