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
    
    /**
    * Return current month in decimal format
    * 
    */
    public static function getCurrentNumberMonth(){
        return Carbon::now()->format('m');
    }
    
    /**
    * Return current month in string format
    * 
    */
    public static function getCurrentStringMonth(){
        return Carbon::now()->format('M');
    }
    
    /**
    * Return current year
    * 
    */
    public static function getCurrentYear(){
        return Carbon::now()->format('Y');
    }
    
    /**
    * Return current date in number format
    */
    public static function getCurrentDateInNumber(){
        return Carbon::now()->format('d');
    }
    
    /**
    * Return current date in name format
    */
    public static function getCurrentDateInName(){
        return Carbon::now()->format('D');
    }

    /**
     * Return first day of given month in y-m-d format
     * 
     * @param String $month The given month in string format
     */
    public static function getFirstDayByGivenMonthInYmd($month){
        $datetimeUtil = new DateTimeUtil;
        return (new Carbon('first day of '.$month.' '.$datetimeUtil->getCurrentYear()))->format('Y-m-d');
    }

    /**
     * Return last day of given month in y-m-d format
     * 
     * @param String $month The given month in string format
     */
    public static function getLastDayByGivenMonthInYmd($month){
        $datetimeUtil = new DateTimeUtil;
        return (new Carbon('last day of '.$month.' '.$datetimeUtil->getCurrentYear()))->format('Y-m-d');
    }
}