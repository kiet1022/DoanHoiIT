@php
    $i=0;
@endphp
<table>
    <thead>
    <tr style="background-color:red;">
        <th>STT</th>
        <th>MSSV</th>
        <th>Họ tên</th>
    </tr>
    </thead>
    <tbody>
    @foreach($details as $detail)
        <tr>
            <td>{{$i++}}</td>
            <td>{{ $detail->student_id }}</td>
            <td>
                @if(!is_null($detail->ofStudent))
                {{ $detail->ofStudent->name }}
                @else
                {{"Sinh viên không xác định"}}
                @endif
            </td>
        </tr>
    @endforeach
    </tbody>
</table>