@extends('admin.layout.layout')
@section('title')
Chỉnh sửa thông tin chi đoàn
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Chỉnh sửa thông tin chi đoàn</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_edit_class',['id'=>$class->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">       
                            <div class="form-inline cm-inline-form">
                                <label for="schoolYear" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select disabled id="schoolYear" class="form-control col-md-4" name="schoolYear">
                                    <option value="{{$class->school_year_id}}" >{{$class->schoolYear->name}} </option>
                                </select>
                            </div> 
                            <div class="form-inline cm-inline-form">
                                <label for="name" class="col-md-2 common-label-inline">Tên chi đoàn <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-8" id="name" name="name" placeholder="" required value="{{$class->class_name}}">
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