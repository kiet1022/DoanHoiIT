<?php

namespace App\Imports;

use App\Models\Student;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToArray;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
class ImportStudent implements ToModel, ToArray,WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

    use Importable;

    public function array(array $row) {
        if(!is_null($row[0])) {
          return $row;
        }
      }

    public function model(array $row)
    {
        // if(!isset($row[0])){
        //     return null;
        // }
        // if(!is_null($row[0])){
        //     return new Student([
        //         'student_id' => $row['mssv'],
        //         'name' => $row['ho_ten'],
        //         'birthday' => $row['ngay_sinh'],
        //         'sex' => $row['gioi_tinh'],
        //         'province' => $row['ma_tt'],
        //         'district' => $row['ma_qh'],
        //         'phone_no' => $row['sdt'],
        //         'address' => $row['dia_chi_day_du'],
        //         'school_year_id' => $row['nien_khoa'],
        //         'class_id' => intval($row['lop']) 
        //     ]);
        // }
        // return null;
    }
}
