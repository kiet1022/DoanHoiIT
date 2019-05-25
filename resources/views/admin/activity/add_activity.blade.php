@extends('admin.layout.layout')
@section('title','Thêm hoạt động')
@section('style')
<link href="{{asset('assets/css/admin/common.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/vendor/icheck-1.x/skins/flat/green.css')}}" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<link rel="stylesheet" href="{{ asset('assets/vendor/datepicker-master/dist/datepicker.css') }}">
@endsection
@section('main_content')
<div class="row">
    <div class="col page-title-header">
        <h4>Nhập thông tin chương trình</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 custom_panel">
        <form action="{{ route('post_add_activity') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-row">
                {{-- Basic info --}}
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <b>Thông tin chương trình</b>
                        </div>
                        <div class="card-body">
                            {{-- Activity Name --}}
                            <div class="form-inline cm-inline-form">
                                <label for="name" class="col-md-6 common-label-inline">Tên chương trình <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <input type="text" class="form-control col-md-6" id="name" name="name" placeholder="Tên chương trình" required value="{{old('name')}}">
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('name'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('name') as $name)
                                    <li>{{$name}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Năm học --}}
                            <div class="form-inline cm-inline-form">
                                <label for="year" class="col-md-6 common-label-inline">Năm học <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="year" class="form-control col-md-6" name="year" required >
                                @foreach ($year as $y)
                                    <option value="{{$y->name}}">{{$y->name}}</option>
                                @endforeach
                                </select>
                            </div>

                            {{-- error --}}
                            @if ($errors->get('year'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('year') as $year)
                                    <li>{{$year}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Học kỳ --}}
                            <div class="form-inline cm-inline-form">
                                <label for="semester" class="col-md-6 common-label-inline">Học kỳ <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="semester" class="form-control col-md-6" name="semester" required >
                                    <option value="1">Kỳ 1</option>
                                    <option value="2">Kỳ 2</option>
                                </select>
                            </div>

                            {{-- error --}}
                            @if ($errors->get('name'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('name') as $name)
                                    <li>{{$name}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Người đứng chính --}}
                            <div class="form-inline cm-inline-form">
                                <label for="leader" class="col-md-6 common-label-inline">Đứng chính <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <select id="leader" class="form-control col-md-6" name="leader" required >
                                @foreach ($leader as $l)
                                <option value="{{$l['student_id']}}">{{$l['name']}} - {!! changeLevelLabel($l['level'],$l['type']) !!}</option>
                                @endforeach
                                </select>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('leader'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('leader') as $leader)
                                    <li>{{$leader}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Ngày bắt đầu chương trình --}}
                            <div class="form-inline cm-inline-form">
                                <label for="startDate" class="col-md-6 common-label-inline">Ngày bắt đầu chương trình <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <div class="col-md-6 px-0">
                                        <input style="width: inherit;" id="startDate" width="100%" class="form-control" name="startDate" maxlength="10" required value="{{ old('startDate') }}"  >
                                </div>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('startDate'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('startDate') as $startDate)
                                    <li>{{$startDate}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Ngày kết thúc chương trình --}}
                            <div class="form-inline cm-inline-form">
                                <label for="endDate" class="col-md-6 common-label-inline">Ngày kết thúc chương trình <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <div class="col-md-6 px-0">
                                        <input style="width: inherit;" id="endDate" width="100%" class="form-control" name="endDate" maxlength="10" required value="{{ old('endDate') }}"  >
                                </div>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('endDate'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('endDate') as $endDate)
                                    <li>{{$endDate}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Ngày bắt đầu đăng kí --}}
                            <div class="form-inline cm-inline-form">
                                <label for="startRegisDate" class="col-md-6 common-label-inline">Ngày bắt đầu đăng ký <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <div class="col-md-6 px-0">
                                        <input style="width: inherit;" id="startRegisDate" width="100%" class="form-control" name="startRegisDate" maxlength="10" required value="{{ old('startRegisDate') }}"  >
                                </div>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('startRegisDate'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('startRegisDate') as $startRegisDate)
                                    <li>{{$startRegisDate}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Ngày kết thúc đăng kí --}}
                            <div class="form-inline cm-inline-form">
                                <label for="endRegisDate" class="col-md-6 common-label-inline">Ngày kết thúc đăng ký <small class="common-required" data-toggle="tooltip" data-placement="top" title="Bắt buộc">(*)</small>:</label>
                                <div class="col-md-6 px-0">
                                        <input style="width: inherit;" id="endRegisDate" width="100%" class="form-control" name="endRegisDate" maxlength="10" required value="{{ old('endRegisDate') }}"  >
                                </div>
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('endRegisDate'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('endRegisDate') as $endRegisDate)
                                    <li>{{$endRegisDate}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Student ID --}}
                            <div class="form-inline cm-inline-form">
                                <label for="maxRegisNum" class="col-md-6 common-label-inline">Số lượng tham gia:</label>
                                <input type="number" class="form-control col-md-6" id="maxRegisNum" name="maxRegisNum" placeholder="Số lượng sinh viên tham gia" value="{{old('maxRegisNum')}}">
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('maxRegisNum'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('maxRegisNum') as $maxRegisNum)
                                    <li>{{$maxRegisNum}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Student ID --}}
                            <div class="form-inline cm-inline-form">
                                <label for="practiseMark" class="col-md-6 common-label-inline">Điểm rèn luyện:</label>
                                <input type="number" class="form-control col-md-6" id="practiseMark" name="practiseMark" placeholder="Điểm rèn luyện" value="{{old('practiseMark')}}">
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('practiseMark'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('practiseMark') as $practiseMark)
                                    <li>{{$practiseMark}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            {{-- Student ID --}}
                            <div class="form-inline cm-inline-form">
                                <label for="socialMark" class="col-md-6 common-label-inline">Điểm CTXH:</label>
                                <input type="number" class="form-control col-md-6" id="socialMark" name="socialMark" placeholder="Điểm CTXH" value="{{old('socialMark')}}">
                            </div>
                            
                            {{-- error --}}
                            @if ($errors->get('socialMark'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-6 offset-md-6 cm-ul-error">
                                    @foreach ($errors->get('socialMark') as $socialMark)
                                    <li>{{$socialMark}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
                
                {{-- Advanced info --}}
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <b>Nội dung chương trình</b>
                        </div>
                        <div class="card-body">
                            <div class="form-inline cm-inline-form">
                                <label for="activityContent" class="col-md-6 col-sm-4 col-xs-4 common-label-inline">Nội dung:</label>
                                <textarea id="activityContent" name="activityContent"></textarea>
                            </div>

                            <div class="form-inline cm-inline-form">
                                <label for="planUrl" class="col-md-6 common-label-inline">Upload file kế hoạch:</label>
                            <input type="file" name="planUrl" id="planUrl" class="col-md-12 col-xs-12 col-sm-12 form-control" style="height: auto;" value="{{ old('planUrl') }}">
                            </div>
                            {{-- error --}}
                            @if ($errors->get('planUrl'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-12 cm-ul-error">
                                    @foreach ($errors->get('planUrl') as $planUrl)
                                    <li>{{$planUrl}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif

                            <div class="form-inline cm-inline-form">
                                <label for="fundUrl" class="col-md-6 common-label-inline">Upload file dự trù:</label>
                                <input type="file" name="fundUrl" id="fundUrl" class="col-md-12 col-xs-12 col-sm-12 form-control" style="height: auto;" value="{{ old('fundUrl') }}">
                            </div>
                            {{-- error --}}
                            @if ($errors->get('fundUrl'))
                            <div class="form-inline cm-inline-form cm-error">
                                <ul class="col-md-12 cm-ul-error">
                                    @foreach ($errors->get('fundUrl') as $fundUrl)
                                    <li>{{$fundUrl}}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                        </div>
                    </div> 
                </div>
            </div>
            <hr class="sidebar-divider">
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-success cm-btn-form">Submit</button>
                <button id="clear" onclick="clearValue()" type="button" class="btn btn-warning cm-btn-form">Clear</button>
            </div>
        </form>
    </div>
    {{-- Breadcrumb --}}
    <div class="col-md-12">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb cm-breadcrumb">
                <li class="breadcrumb-item"><a href="{{ URL::previous() }}" class="cm-breadcrumb-a"><i class="fas fa-arrow-circle-left"></i> Quay lại</a></li>
                {{-- <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa thông tin</li> --}}
            </ol>
        </nav>
    </div>
</div>
@endsection
@section('js')
<script src="{{asset('assets/vendor/icheck-1.x/icheck.js')}}"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="{{ asset('assets/vendor/datepicker-master/dist/datepicker.js') }}"></script>
<script src="{{ asset('assets/vendor/datepicker-master/i18n/datepicker.vi-VN.js') }}"></script>
<script src="{{asset('assets/js/ckeditor/ckeditor.js')}}"></script>
<script>
    @if(session('error'))
        var error = "{{session('error')}}";
        showNotify('error',error);
    @endif
    @if(session('success'))
        var success = "{{session('success')}}";
        showNotify('success',success);
    @endif
</script>
<script src="{{asset('assets/js/admin/activity/add_activity.js')}}"></script>
@endsection