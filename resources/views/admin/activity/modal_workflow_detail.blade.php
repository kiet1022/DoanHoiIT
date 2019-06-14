    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Thông tin chương trình</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <form action="{{ route('edit_workflow_detail')}}" method="POST">
          <div class="modal-body">
            @csrf
            <div class="form-group">
              <label for="leadr">Người đảm nhiệm</label>
              <input class="form-control" type="text" name="leader" value="{{ $workflowDetail['of_student']['name'] }}" readonly>
            </div>
            <div class="form-group">
              <label for="content">Nội dung công việc</label>
              {{-- <input class="form-control" type="text" name="contentDetail" value="{{ $workflowDetail['content'] }}"> --}}
              <textarea name="contentDetail" class="form-control" cols="30" rows="4">{{ $workflowDetail['content'] }}</textarea>
              <input type="hidden" name="id" value="{{ $workflowDetail['id'] }}"/>
            </div>
            <div class="card">
              <div class="card-header">
                <h5 class="card-title" style="color:red;">Chi tiết công việc</h5>
              </div>
              <div class="card-body" style="overflow-y: auto; max-height: 300px;">
                <ul class="list-group list-group-flush" id="detail-content">
                  @foreach ($workflowDetail['details'] as $detail)
                  <li class="list-group-item" id="card_{{$detail['id']}}">
                    <div class="form-row">
                      <div class="form-group cm-inline-form col-md-7">
                        <label for="content_0">Tên</label>
                        <input id="content_0" class="form-control" type="text" name="content_[]" value="{{ $detail['content'] }}">
                        <input type="hidden" name="workflowId_[]" value="{{$detail['id']}}">
                      </div>
                      
                      <div class="form-group cm-inline-form col-md-4">
                        <label for="progress_0">Tiến độ (%)</label>
                        <input id="progress_0" class="form-control" type="number" name="progress_[]" value="{{ $detail['progress'] }}">
                      </div>
                      
                      <div class="form-group cm-inline-form col-md-1 text-right">
                        <a class="add mr-1 text-success"><i class="fas fa-plus"></i></a>
                        <a class="delete text-danger" data-delete="{{$detail['id']}}"><i class="fas fa-minus "></i></a>
                      </div>
                    </div>
                  </li>
                  @endforeach
                </ul>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-success" style="width: 100%">Lưu</button>
          </div>
        </form>
      </div>
    </div>
    
    <script>
      var count = {{count($workflowDetail['details'])}}
    </script>