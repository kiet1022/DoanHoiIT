@extends('admin.layout.layout')
@section('title')
Thêm chi đoàn
@endsection
@section('style')
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
                                <label for="schoolYear" class="col-md-2 common-label-inline">Khóa <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="schoolYear" class="form-control col-md-4" name="schoolYear">
                                    @foreach ($schoolYear as $list)
                                    <option value="{{$list->id}}" >{{$list->name}}  ||  {{$list->course}}</option>

                                    @endforeach
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
@endsection