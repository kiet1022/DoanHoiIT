@extends('student.layout.index')
@section('title')
{{$activity->name}}
@endsection
@section('style')
<link rel="stylesheet" href="{{ asset('pages/css/new.css') }}">
@endsection
@section('content')

<!-- section -->
<!-- Page Header -->
<div id="post-header" class="page-header" style="padding-top: 10%; padding-bottom: 10%;">
  <div class="background-img" style="background-image: url('{{ asset('images/news/vzql_background.jpg') }}');"></div>
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
    <div class="col-md-8">
      <div class="section-row sticky-container">
        <div class="main-post">
          <h3 style="color: #4e73df">Thông tin chương trình</h3>
          <table class="table table-striped">
            <tbody>
              <tr>
                <th>Tên chương trình</th>
                <td>{{ $activity->name }}</td>
              </tr>
              <tr>
                <th>Thời hạn đăng ký</th>
                <td>Từ ngày {{date('d/m/Y',strtotime($activity->start_regis_date))}} đến ngày {{date('d/m/Y',strtotime($activity->end_regis_date))}}</td>
              </tr>
              
              <tr>
                <th>Số lượng đăng ký</th>
                <td>{{ $activity->max_regis_num }}</td>
              </tr>
              
              <tr>
                <th>Thời gian diễn ra chương trình</th>
                <td>Từ ngày {{date('d/m/Y',strtotime($activity->start_date))}} đến ngày {{date('d/m/Y',strtotime($activity->end_date))}}</td>
              </tr>
              
              <tr>
                <th>Nội dung</th>
                <td>{!! $activity->content !!}</td>
              </tr>
              
              <tr>
                <th>Điểm cộng</th>
                <td>
                  @if ($activity->practise_marks > 0)
                      {{ $activity->practise_marks }} ĐRL
                  @elseif ($activity->social_marks > 0)
                    {{ $activity->practise_marks }} Điểm CTXH
                  @endif
                </td>
              </tr>
              <tr>
                <th>Liên hệ</th>
              <td>{{ $activity->leadBy->name }} <br> Email: {{ $activity->leadBy->user->email }}</td>
              </tr>
              <tr>
                @auth
                <td colspan="2" class="text-center">
                  @if ($isAttend)
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
      <div class="aside-widget text-center">
        <a href="#" style="display: inline-block;margin: auto;">
          <img class="img-responsive" src="./img/ad-1.jpg" alt="">
        </a>
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
