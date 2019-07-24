@extends('student.layout.index')
@section('title', $activity->name)
@section('style')
<link rel="stylesheet" href="{{ asset('pages/css/new.css') }}">
@endsection
@section('content')

<!-- section -->
<!-- Page Header -->
<section id="news">
  <div class="section" style="padding-top: 0">
<div id="post-header" class="page-header" style="padding-top: 50px; padding-bottom: 50px;">
  <div class="background-img" style="background-image: url('{{ asset('assets/fileupload/activities/images/'.$activity->image) }}');"></div>
  {{-- {{ asset('images/news/'.$detail->image) }} --}}
  <div class="container">
    <div class="row">
      <div class="col-md-10">
        <div class="post-meta">
          {{-- <a class="post-category {{changeCatColor($detail->type_id)}}" href="category.html">{{$detail->ofType->name}}</a> --}}
          {{-- <span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($activity->created_at))}}</span> --}}
        </div>
        <h1>{{$activity->name}}</h1>
      </div>
    </div>
  </div>
</div>
<!-- /Page Header -->
<!-- container -->
<div class="container" style="margin-top: 15px">
  <!-- row -->
  <div class="row">
    <!-- Post content -->
    <div class="col-md-8 col-sm-12">
      <div class="section-row sticky-container">
        <div class="main-post">
          <h3 style="color: #4e73df">Thông tin chương trình</h3>
          <table >
            <tbody>
              <tr >
                <th class="col-sm-6">Tên chương trình</th>
                <td class="col-sm-6">{{ $activity->name }}</td>
              </tr>
              <tr>
                <th class="col-sm-6">Thời hạn đăng ký</th>
                <td class="col-sm-6">Từ ngày {{date('d/m/Y',strtotime($activity->start_regis_date))}} đến ngày {{date('d/m/Y',strtotime($activity->end_regis_date))}}</td>
              </tr>
              
              <tr>
                <th class="col-sm-6">Số lượng đăng ký hiện tại</th>
                <td class="col-sm-6">{{ $activity->register_number }}</td>
              </tr>
              
              <tr>
                <th class="col-sm-6">Số lượng đăng ký tối đa</th>
                <td class="col-sm-6">{{ $activity->max_regis }}</td>
              </tr>

              <tr>
                <th class="col-sm-6">Thời gian diễn ra chương trình</th>
                <td class="col-sm-6">Từ ngày {{date('d/m/Y',strtotime($activity->start_date))}} đến ngày {{date('d/m/Y',strtotime($activity->end_date))}}</td>
              </tr>
              
              <tr>
                <th class="col-sm-6">Nội dung</th>
                <td class="col-sm-6">{!! $activity->content !!}</td>
              </tr>
              
              <tr>
                <th class="col-sm-6">Điểm cộng</th>
                <td class="col-sm-6">
                  @if ($activity->practise_marks > 0)
                      {{ $activity->practise_marks }} ĐRL
                  @elseif ($activity->social_marks > 0)
                    {{ $activity->practise_marks }} Điểm CTXH
                  @endif
                </td>
              </tr>
              <tr>
                <th class="col-sm-6">Liên hệ</th>
              <td class="col-sm-6">{{ $activity->leadBy->name }} <br> Email: {{ $activity->leadBy->user->email }}</td>
              </tr>
              <tr>
                @auth
                <td colspan="2" class="text-center">
                  @if($activity->register_number != 0 && $activity->register_number == $activity->max_regis)
                  <span class="label label-warning" style="font-size: 100%">Hiện tại đã đủ số lượng sinh viên đăng kí tham gia chương trình</span>
                  @elseif ($isAttend)
                  <form action="{{ route('cancel_regis_activity')}}" method="POST">
                      @csrf
                      <input type="hidden" name="activity_id" value="{{ $activity->id }}">
                      <button class="btn btn-danger" type="submit">Hủy đăng ký</button>
                  </form>
                  @else
                  <form action="{{ route('attend_activity')}}" method="POST">
                      @csrf
                      <input type="hidden" name="activity_id" value="{{ $activity->id }}">
                      <button class="btn" type="submit" style="background-color: #4e73df;color: white;">Đăng ký</button>
                  </form>
                  @endif
                </td>
                @endauth
                @guest
                <td colspan="2" class="text-center">
                    <span class="label label-warning" style="font-size: 100%">Vui lòng đăng nhập để đăng kí tham gia chương trình</span>
                </td>
                @endguest
              </tr>
            </tbody>
          </table>
          {{-- {!! $activity->content !!} --}}
        </div>
        <div class="post-shares sticky-shares">
          <a href="https://www.facebook.com/DoanHoiITUTE/" target="_blank" class="share-facebook"><i class="fa fa-facebook"></i></a>
          <a href="mailto:doaihoiitspkt@gmail.com" class="share-google-plus" target="_blank"><i class="fa fa-google-plus"></i></a>
          <a href="http://fit.hcmute.edu.vn/" class="share-website" target="_blank"><i class="fa fa-globe"></i></a>
        </div>
      </div>                         
    </div>
    <!-- /Post content -->
    
    <!-- aside -->
    <div class="col-md-4">
      <!-- ad -->
      <div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
        <div class="col-md-8 badge-header-primary">
          <h4 style="color: white; margin: 5px">Chương trình tháng {{ (\Carbon\Carbon::now())->format('m') }}</h4>
        </div>
        <div class="col-md-12" style="border-bottom: 2px solid #4e73df ;">
        </div>
      </div>
      <div class="aside-widget">
        @foreach($activities as $act)
        <div class="post post-widget">
          <a class="post-img" href="{{ route('user_get_activity_detail',['id'=>$act->id]) }}">
              @if ($act->image)
              <img style="width: 90px; height: 49px;" src="{{ asset('assets/fileupload/activities/images/'.$act->image) }}" alt="Lỗi">
              @else
              <img style="width: 90px; height: 49px;" src="{{ asset('assets/img/faculty_banner.png') }}" alt="Lỗi">
              @endif
          </a>
          <div class="post-body">
            <h3 class="post-title"><a href="{{ route('user_get_activity_detail',['id'=>$act->id]) }}">{{$act->name}}</a></h3>
            <span class="post-date">Thời gian: {{date('d/m/Y',strtotime($act->start_date))}} - {{date('d/m/Y',strtotime($act->end_date))}}</span>
          </div>
        </div>
        @endforeach
      </div>
      <!-- /ad -->
      
      <!-- post widget -->
      {{-- <div class="aside-widget">
        <div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
          <div class="col-md-7 badge-header-warning">
            <h4 style="color: white; margin: 5px">Bài viết cùng chủ đề</h4>
          </div>
          <div class="col-md-12" style="border-bottom: 2px solid #f4b619 ;">
          </div>
        </div>
        @foreach($relatedPost as $rl)
        <div class="post post-thumb">
          <a class="post-img" href="{{ route('get_new_detail',['id'=>$rl->id]) }}">
            <img src="{{ asset('images/news/'.$rl->image) }}" alt="Lỗi" style="width: 360px; height: 197px;">
          </a>
          <div class="post-body">
            <div class="post-meta">
              <a class="post-category {{changeCatColor($rl->type_id)}}" href="">{{$rl->ofType->name}}</a>
              <span class="post-date">Ngày đăng: {{date('d/m/Y',strtotime($rl->created_at))}}</span>
            </div>
            <h3 class="post-title"><a href="{{ route('get_new_detail',['id'=>$rl->id]) }}">{{$rl->title}}</a></h3>
          </div>
        </div>
        @endforeach
      </div> --}}
      <!-- /post widget -->
      
      <!-- catagories -->
      {{-- <div class="aside-widget">
        <div class="col-md-12 text-center" style="margin-bottom: 15px; padding: 0">
          <div class="col-md-6 badge-header-danger">
            <h4 style="color: white; margin: 5px">Danh mục tin tức</h4>
          </div>
          <div class="col-md-12" style="border-bottom: 2px solid #e74a3b ;">
          </div>
        </div>
        <div class="category-widget">
          <ul>
            @foreach($newsType as $nt)
            <li><a href="#" class="{{changeCatColor($nt->id)}}">{{$nt->name}}<span>{{count($nt->news)}}</span></a></li>
            @endforeach
          </ul>
        </div>
      </div> --}}
      <!-- /catagories -->
    </div>
    <!-- /aside -->
  </div>
  <!-- /row -->
</div>
<!-- /container -->
</div>
</div></section>
<!-- /section -->
@endsection
@section('js')
<script>
    @if(session('error'))
    var error = "{{session('error')}}";
    showNotify('error',error);
    @endif
    @if(session('success'))
    var success = "{{session('success')}}";
    console.log(success)
    showNotify('success',success);
    @endif

    $('form').on('submit', function(){
      blockUI(true);
    });
</script>
@endsection
