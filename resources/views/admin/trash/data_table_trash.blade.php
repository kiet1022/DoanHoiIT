@if($type === config('constants.TRASH_STUDENTS'))
<thead style="background: #f8f9fc">
    <tr>
        <th></th>
        <th>MSSV</th>
        <th>Họ Tên</th>
        <th>Khóa</th>
        <th>Lớp</th>
        <th>Giới tính</th>
        <th>Ngày sinh</th>
        <th>Tình trạng</th>
        <td>Ngày xóa</td></td>
        {{-- <th></th> --}}
    </tr>
</thead>
<tbody>
    @foreach ($studentList as $list)
    <tr class="">
        <td><input type="hidden" value="{{$list->student_id}}"></td>
        <td>{{$list->student_id}}</td>
        <td>{{$list->name}}</td>
        <td>{{$list->schoolYear->course}}</td>
        <td>{{$list->class->class_name}}</td>
        <td>{!! changeGenderForList($list->sex) !!}</td>
        <td>{{date('d/m/Y',strtotime($list->birthday))}}</td>
        <td class="text-center">{!! changeStudyStatus($list->is_study)!!}</td>
        <td>{{ date('d/m/Y',strtotime($list->deleted_at)) }}</td>
        {{-- <td class="text-center">
            <a onclick="restoreActivity()" class="btn btn-outline-primary"><i class="fas fa-trash-restore"></i> Restore</a>
        </td> --}}
    </tr>
    @endforeach
</tbody>
@elseif($type === config('constants.TRASH_ACTIVITIES'))
<thead style="background: #f8f9fc">
    <tr>
        <th></th>
        <th>Mã chương trình</th>
        <th>Tên chương trình</th>
        <th>Thời gian diễn ra</th>
        <th>Sinh viên đứng chính</th>
        <th>Trạng thái</th>
        <th>Ngày xóa</th>
        {{-- <th>Người xóa</th> --}}
        {{-- <th></th> --}}
    </tr>
</thead>
<tbody>
    @foreach ($activities as $activity)
    <tr class="">
        <td></td>
        <td>{{$activity->id}}</td>
        <td>{{$activity->name}}</td>
        <td>{{date('d/m/Y',strtotime($activity->start_date))}} - {{date('d/m/Y',strtotime($activity->end_date))}}</td>
        <td>{{$activity->leadBy->name}} - {{$activity->leadBy->student_id}}</td>
        <td class="text-center">{!! changeActivityStatus($activity->start_date, $activity->end_date) !!}</td>
        <td>{{ date('d/m/Y',strtotime($activity->deleted_at)) }}</td>
        {{-- <td>{{ $activity->updated_by }}</td> --}}
        {{-- <td class="text-center">
            <a class="btn btn-outline-primary restore-activity" data-id="{{$activity->id}}"><i class="fas fa-trash-restore"></i> Restore</a>
        </td> --}}
    </tr>
    @endforeach
</tbody>
@elseif($type === config('constants.TRASH_NEWS'))
<thead style="background: #f8f9fc">
    <tr>
        <th></th>
        <th>Tên tin</th>
        <th>Tên chương trình</th>
        <th>Thời gian diễn ra</th>
        <th>Sinh viên đứng chính</th>
        <th>Ngày xóa</th>
    </tr>
</thead>
<tbody>
    @foreach ($newList as $new)
    <tr class="">
        <td></td>
        <td>{{$new->id}}</td>
        <td>{{$new->sumary}}</td>
        <td>{{$new->content}}</td>
        <td>{{$new->title}}</td>
        <td>{{ date('d/m/Y',strtotime($new->deleted_at)) }}</td>
    </tr>
    @endforeach
</tbody>
@endif