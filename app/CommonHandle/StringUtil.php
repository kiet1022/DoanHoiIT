<?php
namespace App\CommonHandle;

class StringUtil{
    public static function pureString($value){
        if($value === config('constants.BLANK_STRING')){
            $value = null;
        }
        return $value;
        
    }
}