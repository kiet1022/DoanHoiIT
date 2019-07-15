@extends('admin.layout.layout')
@section('title')
Thêm niên k
@endsection
@section('style')
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Thêm chương trình đào tạo</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_add_program') }}" method="POST" enctype="multipart/form-data">
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
                                <input type="text" class="form-control col-md-8" id="course" name="course" placeholder="" required value="{{old('course')}}">
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