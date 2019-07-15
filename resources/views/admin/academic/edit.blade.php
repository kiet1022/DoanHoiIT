@extends('admin.layout.layout')
@section('title')
Chương trình đào tạo
@endsection
@section('style')
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Chỉnh sửa niên khóa</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_program',['id'=>$schoolYear->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select disabled="" id="type" class="form-control col-md-2" name="type">
                                    <option> {{($schoolYear->type)*2}} năm</option>
                                </select>
                            </div> 
                            <div class="form-inline cm-inline-form">
                                <label for="type" class="col-md-2 common-label-inline">Loại thời gian <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select disabled="" id="start" class="form-control col-md-2" name="start">
                                    <option value>{{$yearStart}}</option>
                                </select>
                                <label class="col-md-1">  -  </label>
                                <select disabled="" id="end" class="form-control col-md-2" name="end">
                                    <option value="" >{{$yearEnd}}</option>
                                </select>
                            </div>
                            {{-- error --}}
                            @if ($errors->get('start'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-8 offset-md-4 cm-ul-error">
                                    @foreach ($errors->get('start') as $start)
                                    <li>{{$start}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <div class="form-inline cm-inline-form">
                                <label for="course" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="course" name="course" placeholder="" required value="{{$schoolYear->course}}">
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
<script type="text/javascript">
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