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
                            <div class="card-body editDetail">
                                <div class="form-group">
                                    <label for="sid">MSSV</label>
                                <input type="text" name="sid" id="sid" class="form-control" value="{{ $execComm->ofStudent->student_id }}">
                                </div>
                                
                                <div class="form-group">
                                    <label>Họ tên:</label>
                                    <label style="display: inline-table;" class="form-control cm-label-detail text-center name">{{ $execComm->ofStudent->name }}</label>
                                </div>
                                
                                <div class="form-group">
                                    <label>Chức vụ:</label>
                                    <label style="display: inline-table;" class="form-control cm-label-detail text-center">{!! changeLevelLabel($execComm->level, $commType) !!}</label>
                                </div>
                                
                                <div class="form-group">
                                    <label>Lớp:</label>
                                    <label style="display: inline-table;" class="form-control cm-label-detail text-center class_name">{{ $execComm->ofStudent->class->class_name }}</label>
                                </div>
                                
                                <div class="form-group">
                                    <label>Địa chỉ:</label>
                                    <label style="display: inline-table;" class="form-control cm-label-detail text-center staddress">{{ $execComm->ofStudent->address }}</label>
                                </div>
                                <div class="form-group text-center">
                                <a href="#" class="btn btn-primary text-right" id="checkInfo" class="btn btn-primary">Kiểm tra thông tin</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    {{-- Picture --}}
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                Hình ảnh
                            </div>
                            <div class="card-body imgExec">
                            <img  id="detailImg" src="{{ asset('assets/img/students/'.$execComm->ofStudent->image) }}" 
                            onError='this.onerror=null;this.src="{{ asset('assets/img/image-not-available.png') }}";' 
                            alt="Không có hình ảnh" style="max-width: -webkit-fill-available;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" data-id="{{ $execComm->ofStudent->student_id }}" data-type="{{ $commType }}" class="btn btn-primary" style="width: 100%" disabled>Lưu</button>
            </div>
        </div>
    </div>