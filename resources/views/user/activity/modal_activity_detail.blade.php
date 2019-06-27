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
                <table class="activity-detail table table-hover table-bordered">
                    <tbody>
                      <tr>
                        <th>Tên chương trình</th>
                        <td>{{ $activity->name }}</td>
                        <th>Năm học</th>
                        <td>{{ $activity->year }}</td>
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
                    </tbody>
                  </table>
            </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-info" data-dismiss="modal" style="width: 100%">Đóng</button>
        </div>
    </div>
</div>