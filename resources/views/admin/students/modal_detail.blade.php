<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Thông tin Sinh Viên</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          {{-- Basic info --}}
          <div class="col-md-6">
            <div class="card mb-4">
              <div class="card-header">
                Thông tin chung
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label>Mã số sinh viên:</label>
                <label class="form-control cm-label-detail text-center">{{$student->student_id}}</label>
                </div>
                
                <div class="form-group">
                  <label>Họ tên:</label>
                <label class="form-control cm-label-detail text-center">{{$student->name}}</label>
                </div>
                
                
                <div class="form-group">
                  <label>Giới tính:</label>
                  <label class="form-control cm-label-detail text-center">{!! changeGenderForList($student->sex) !!}</label>
                </div>
                
                <div class="form-group">
                  <label>Ngày sinh:</label>
                  <label class="form-control cm-label-detail text-center">{{date('d/m/Y',strtotime($student->birthday))}}</label>
                </div>
                
                <div class="form-group">
                  <label>CMND:</label>
                <label class="form-control cm-label-detail text-center">{{$student->identity_card}}</label>
                </div>

                <div class="form-group">
                    <label>SDT:</label>
                  <label class="form-control cm-label-detail text-center">{{$student->phone_no}}</label>
                  </div>
              </div>
            </div>
          </div>
          
          {{-- advanced info --}}
          <div class="col-md-6">
            <div class="card mb-4">
              <div class="card-header">
                Thông tin thêm
              </div>
              <div class="card-body">

                  <div class="form-group">
                      <label>Địa chỉ:</label>
                    <label class="form-control cm-label-detail text-center">{{$student->address}}</label>
                    </div>

                <div class="form-group">
                  <label>Niên khóa:</label>
                <label class="form-control cm-label-detail text-center">{{$student->schoolYear->course}}</label>
                </div>
                
                <div class="form-group">
                  <label>Lớp:</label>
                <label class="form-control cm-label-detail text-center">{{$student->class->class_name}}</label>
                </div>
                
                <div class="form-group">
                  <label>Trạng thái:</label>
                  <label class="form-control cm-label-detail text-center">{!! changeStudyStatus($student->is_study)!!}</label>
                </div>
                
                <div class="form-group">
                  <label>Đoàn viên:</label>
                <label class="form-control cm-label-detail text-center">{!! changeUnionStatus($student->is_youth_union_member) !!}</label>
                </div>
                
                <div class="form-group">
                  <label>Ngày vào đoàn:</label>
                  <label class="form-control cm-label-detail text-center">{{date('d/m/Y',strtotime($student->date_on_union))}}</label>
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