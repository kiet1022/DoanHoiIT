<?php
namespace App\CommonHandle;
use App\SchoolYear;
use App\Classes;

class StudentUtil{

    public static function parseSexToInt($value){
        if($value === trim('Nam')){
            return $value = 1;
        }else if($value === trim('Nữ')){
            return $value = 2;
        }else {
            return $value = 3;
        }
    }

    public static function parseSchoolYearToInt($value){
        
        $schoolYears = SchoolYear::where('course',trim($value))->first();
        return $schoolYears->id;
    }

    public static function parseClassToInt($value){
        $class = Classes::where('class_name',trim($value))->first();
        return $class->id;
    }
}