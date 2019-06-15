<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Thông tin chương trình {{ $activity->name }}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="row p-2">
                <div id="accordion1" class="col-12 p-0">
                    <div class="card">
                      <div class="card-header" data-toggle="collapse" href="#collapseOne">
                        <a class="card-link">
                          <strong>Thông tin chung</strong>
                        </a>
                      </div>
                      <div id="collapseOne" class="collapse show" data-parent="#accordion1">
                        <div class="card-body">
                            <table class="activity-detail table table-hover table-bordered">
                                <tbody>
                                  <tr>
                                    <th>Tên chương trình</th>
                                    <td>{{ $activity->name }}</td>
                                    <th>Sinh viên đứng chính</th>
                                    <td>{{ $activity->leadBy->name }}</td>
                                  </tr>
                                  <tr>
                                    <th>Năm học</th>
                                    <td>{{ $activity->year }}</td>
                                    <th>Học kỳ</th>
                                    <td>Kỳ {{ $activity->semester }}</td>
                                  </tr>
                                  <tr>
                                    <th>Thời gian đăng ký</th>
                                    <td>{{date('d/m/Y',strtotime($activity->start_regis_date))}} - {{date('d/m/Y',strtotime($activity->end_regis_date))}}</td>
                                    <th>Thời gian bắt đầu</th>
                                    <td>{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}</td>
                                  </tr>
                                  <tr>
                                    <th>Điểm rèn luyện</th>
                                    <td>{{ $activity->practise_marks }}</td>
                                    <th>Điểm CTXH</th>
                                    <td>{{ $activity->social_marks }}</td>
                                  </tr>
                                  <tr>
                                    <th>Nội dung</th>
                                    <td colspan="3">{!! $activity->content !!}</td>
                                  </tr>
                                  <tr>
                                    <th>Link file kế hoạch</th>
                                    <td colspan="3"><a href="{{ asset('assets/fileupload/activities/plans/'.$activity->plan_url) }}">{{ $activity->plan_url }}</a></td>
                                  </tr>
                                  <tr>
                                    <th>Link file DTKP</th>
                                    <td colspan="3"><a href="{{ asset('assets/fileupload/activities/funds/'.$activity->fund_url) }}">{{ $activity->fund_url }}</a></td>
                                  </tr>
                                  <tr>
                                    <th>Tiến độ công việc</th>
                                    <td colspan="3">
                                      @if (  count($activity->workflows) != 0)
                                      <div class="row flex-wrap">
                                          <div class="col-12">
                                              <div class="progress">
                                                  <div class="progress-bar {{ changeProgressbarColor(intval($percent->percent)) }} col-8" role="progressbar" aria-valuenow="{{ intval($percent->percent) }}" aria-valuemin="0" aria-valuemax="100" style='width:{{ intval($percent->percent)}}%'>{{ intval($percent->percent) }}%</div>
                                              </div>
                                          </div>
                                          <div class="col-12 text-center mt-4">
                                              <a href="{{ route('get_list_workflow',['id'=>$activity->id]) }}" class="btn btn-primary btn-sm">Xem tiến độ</a>
                                          </div>
                                      </div>
                                      
            
                                      @else
                                      <div class="text-center">
                                          <a href="{{ route('get_add_workflow',['id'=>$activity->id]) }}" class="btn btn-primary btn-sm">Thêm công việc</a>
                                      </div>
                                      @endif
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="row p-2">
                <div id="accordion2" class="col-12 p-0">
                    <div class="card">
                      <div class="card-header" data-toggle="collapse" href="#collapseTwo">
                        <a class="card-link">
                          <strong>Dự trù kinh phí</strong>
                        </a>
                      </div>
                      <div id="collapseTwo" class="collapse show" data-parent="#accordion2">
                        <div class="card-body">
                          @if(count($activityFundingDetail) >= 1)
                          <table class="table table-hover table-bordered">
                              <thead>
                                <th>STT</th>
                                <th>Nội dung</th>
                                <th>Đơn vị tính</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Thành tiền</th>
                              </thead>
                              <tbody>
                                @php
                                    $i = 1;
                                @endphp
                                @foreach ($activityFundingDetail[0]->details as $detail)
                                  <tr>
                                    <td>{{$i++}}</td>
                                    <td>{{ $detail->content }}</td>
                                    <td>{{ $detail->unit }}</td>
                                    <td>{{ $detail->amount }}</td>
                                    <td>{{ number_format($detail->unit_price) }} VNĐ</td>
                                    <td>{{ number_format($detail->expected_value) }} VNĐ</td>
                                  </tr>
                                @endforeach
                                <tr>
                                  <td colspan="5"> <strong>Tổng tiền: </strong></td>
                                <td><strong>{{ number_format($activityFundingDetail[0]->initial_funds) }} VNĐ</strong></td>
                                </tr>
                              </tbody>
                            </table>
                          @else
                            <div class="text-center">
                                <span class="badge badge-warning">Chưa có thông tin dự trù</span>
                            </div>
                          @endif
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-info" data-dismiss="modal" style="width: 100%">Đóng</button>
        </div>
    </div>
</div>