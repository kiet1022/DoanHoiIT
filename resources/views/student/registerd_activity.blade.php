@extends('student.layout.userindex')
@section('title')
{{"Các chương trình đã đăng ký"}}
@endsection
@section('breadcrumb')
<div class="container">
	<ol class="breadcrumb" style="background-color: #ffffff; margin-bottom: 0px; border-left: 5px solid #4e73df;">
		<li><a href="{{ route('get_home_page') }}" class="text-info">Trang chủ</a></li>
    <li>Các chương trình đã đăng ký</li>
	</ol>
</div>
@endsection
@section('style')

@endsection
@section('content')
<div class="col-md-9" style="background: white; padding-top: 30px;">	
  <div class="col-md-12" style="min-height: 437px;">
    @if (count($attended) > 0)
    <table class="table table-hover">
        <thead>
          <tr>
            <th>Tên chương trình</th>
            <th>Thời gian</th>
            <th>Số lượng SV đăng ký</th>
            <th>Điểm cộng</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          @foreach ($attended as $at)
          <tr>
              <td>{{ $at->ofActivity->name }}</td>
              <td>{{date('d/m/Y',strtotime($at->ofActivity->start_date))}} - {{date('d/m/Y',strtotime($at->ofActivity->end_date))}}</td>
              <td>{{ $at->ofActivity->register_number }}</td>
              <td>
                  @if ($at->ofActivity->practise_marks > 0)
                  {{ $at->ofActivity->practise_marks }} ĐRL
              @elseif ($at->ofActivity->social_marks > 0)
                {{ $at->ofActivity->social_marks }} Điểm CTXH
              @endif
              </td>
              <td>                  
                <form action="{{ route('cancel_regis_activity')}}" method="POST">
                  @csrf
                  <input type="hidden" name="activity_id" value="{{ $at->ofActivity->id }}">
                  <button class="btn btn-danger btn-sm" type="submit">Hủy đăng ký</button>
              </form>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    @else
      <div class="text-center">
          <span class="label label-warning" style="font-size: 100%">Bạn chưa đăng ký tham gia chương trình nào.</span>
      </div>
    @endif
	</div>
</div>
@endsection
@section('js')
<script>
	$('form').on('submit', function(){
		blockUI(true);
	})

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