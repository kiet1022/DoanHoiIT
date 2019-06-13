    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Thông tin chương trình</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <div class="modal-body">
          {{-- <div class="card" style="height: 100%">
            <div class="card-header">
              <h5 class="card-title" style="color:red;">{{ $workflowDetail['of_student']['name'] }}</h5>
            </div>
            <div class="card-body">
              <p class="card-text"><h4 class="text-primary">{{ $workflowDetail['content'] }}</h4></p>
              
            </div>
            
            <div class="card-footer  p-0">
              <a href="#" class="btn btn-primary btn-sm detail" style="width:100%"><i class="fas fa-edit"></i> Edit</a>
            </div>
          </div> --}}
          <div class="form-group">
            <label for="leadr">Người đảm nhiệm</label>
            <input class="form-control" type="text" name="leader" value="{{ $workflowDetail['of_student']['name'] }}" readonly>
          </div>
          <div class="form-group">
            <label for="content">Nội dung công việc</label>
            <input class="form-control" type="text" name="content" value="{{ $workflowDetail['content'] }}">
          </div>
          <div class="card">
            <div class="card-header">
              <h5 class="card-title" style="color:red;">Chi tiết công việc</h5>
            </div>
            <div class="card-body">
              <ul class="list-group list-group-flush">
                @foreach ($workflowDetail['details'] as $detail)
                <li class="list-group-item">
                    <div class="form-row">
                        <div class="form-group cm-inline-form col-md-7">
                            <label for="content">Tên</label>
                            <input class="form-control" type="text" name="content" value="{{ $detail['content'] }}">
                        </div>
  
                        <div class="form-group cm-inline-form col-md-4">
                            <label for="progress">Tiến độ (%)</label>
                              <input class="form-control" type="number" name="progress" value="{{ $detail['progress'] }}">
                        </div>

                        <div class="form-group cm-inline-form col-md-1 text-right">
                            <label><i class="fas fa-plus"></i></label>
                            <label><i class="fas fa-minus"></i></label>
                        </div>
                      </div>
                </li>
                @endforeach
              </ul>
            </div>
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal" style="width: 100%">Đóng</button>
        </div>
      </div>
    </div>