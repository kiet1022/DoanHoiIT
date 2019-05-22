<?php
namespace App\CommonHandle;
use Carbon\Carbon;
class DateTimeUtil{

    /**
     * Convert d/m/Y to Y-m-d format
     * 
     * @param $value date to convert
     */
    public static function convertToYmd($value){
        if(!empty($value)){
            return Carbon::createFromFormat('d/m/Y', trim($value))->format('Y-m-d');
        }
        return '';
    }

    public static function convertYmdTodmY($value){
        if(!empty($value)){
            return Carbon::createFromFormat('Y-m-d', trim($value))->format('d/m/Y');
        }
        return '';
    }
}