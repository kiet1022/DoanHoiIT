<?php

use \Carbon\Carbon;
// Mở composer.json
// Thêm vào trong "autoload" chuỗi sau
// "files": [
	//         "app/function/function.php"
	// ]
	
	// Chạy cmd : composer  dumpautoload
	
	function changeTitle($str,$strSymbol='-',$case=MB_CASE_LOWER){// MB_CASE_UPPER / MB_CASE_TITLE / MB_CASE_LOWER
		$str=trim($str);
		if ($str=="") return "";
		$str =str_replace('"','',$str);
		$str =str_replace("'",'',$str);
		$str = stripUnicode($str);
		$str = mb_convert_case($str,$case,'utf-8');
		$str = preg_replace('/[\W|_]+/',$strSymbol,$str);
		return $str;
	}
	
	function stripUnicode($str){
		if(!$str) return '';
		//$str = str_replace($a, $b, $str);
		$unicode = array(
			'a'=>'á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ|å|ä|æ|ā|ą|ǻ|ǎ',
			'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ|Å|Ä|Æ|Ā|Ą|Ǻ|Ǎ',
			'ae'=>'ǽ',
			'AE'=>'Ǽ',
			'c'=>'ć|ç|ĉ|ċ|č',
			'C'=>'Ć|Ĉ|Ĉ|Ċ|Č',
			'd'=>'đ|ď',
			'D'=>'Đ|Ď',
			'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|ë|ē|ĕ|ę|ė',
			'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ|Ë|Ē|Ĕ|Ę|Ė',
			'f'=>'ƒ',
			'F'=>'',
			'g'=>'ĝ|ğ|ġ|ģ',
			'G'=>'Ĝ|Ğ|Ġ|Ģ',
			'h'=>'ĥ|ħ',
			'H'=>'Ĥ|Ħ',
			'i'=>'í|ì|ỉ|ĩ|ị|î|ï|ī|ĭ|ǐ|į|ı',	  
			'I'=>'Í|Ì|Ỉ|Ĩ|Ị|Î|Ï|Ī|Ĭ|Ǐ|Į|İ',
			'ij'=>'ĳ',	  
			'IJ'=>'Ĳ',
			'j'=>'ĵ',	  
			'J'=>'Ĵ',
			'k'=>'ķ',	  
			'K'=>'Ķ',
			'l'=>'ĺ|ļ|ľ|ŀ|ł',	  
			'L'=>'Ĺ|Ļ|Ľ|Ŀ|Ł',
			'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ|ö|ø|ǿ|ǒ|ō|ŏ|ő',
			'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ|Ö|Ø|Ǿ|Ǒ|Ō|Ŏ|Ő',
			'Oe'=>'œ',
			'OE'=>'Œ',
			'n'=>'ñ|ń|ņ|ň|ŉ',
			'N'=>'Ñ|Ń|Ņ|Ň',
			'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự|û|ū|ŭ|ü|ů|ű|ų|ǔ|ǖ|ǘ|ǚ|ǜ',
			'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự|Û|Ū|Ŭ|Ü|Ů|Ű|Ų|Ǔ|Ǖ|Ǘ|Ǚ|Ǜ',
			's'=>'ŕ|ŗ|ř',
			'R'=>'Ŕ|Ŗ|Ř',
			's'=>'ß|ſ|ś|ŝ|ş|š',
			'S'=>'Ś|Ŝ|Ş|Š',
			't'=>'ţ|ť|ŧ',
			'T'=>'Ţ|Ť|Ŧ',
			'w'=>'ŵ',
			'W'=>'Ŵ',
			'y'=>'ý|ỳ|ỷ|ỹ|ỵ|ÿ|ŷ',
			'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ|Ÿ|Ŷ',
			'z'=>'ź|ż|ž',
			'Z'=>'Ź|Ż|Ž'
		);
		foreach($unicode as $khongdau=>$codau) {
			$arr=explode("|",$codau);
			$str = str_replace($arr,$khongdau,$str);
		}
		return $str;
	}
	
	/**
	* Change gender for list student
	*/
	function changeGenderForList($gender){
		$result = '';
		if($gender == 1){
			$result = 'Nam';
		}if($gender == 2){
			$result = 'Nữ';
		}if($gender == 3){
			$result = 'Khác';
		}
		return $result;
	}
	
	/**
	* Change selected status
	* 
	*/
	function changeSelectedStatus($option, $value){
		$result = '';
		if($value === $option){
			$result = 'selected';
		}
		return $result;
	}
	
	/**
	* Change selected status
	* 
	*/
	function changeCheckedRoleStatus($arrRole, $role){
		$result = '';
		if(in_array($role,$arrRole)){
			$result = 'checked';
		}
		return $result;
	}
	
	/**
	* Change study status for list
	* 
	*/
	
	function changeStudyStatus($value){
		$result = '';
		switch ($value) {
			case 1:
			$result = '<span class="badge badge-primary">Còn học</span>';
			break;
			case 2:
			$result = '<span class="badge badge-success">Đã tốt nghiệp</span>';
			break;
			case 3:
			$result = '<span class="badge badge-warning">Bảo lưu</span>';
			break;
			default:
			$result = '<span class="badge badge-danger">Nghỉ học</span>';
			break;
		}
		return $result;
	}
	
	/**
	* Change union status
	* 
	*/
	
	function changeUnionStatus($value){
		$result = '';
		switch ($value) {
			case 1:
			$result = '<span class="badge badge-primary">Đoàn viên</span>';
			break;
			default:
			$result = '<span class="badge badge-danger">Chưa kết nạp đoàn</span>';
			break;
		}
		return $result;
	}
	
	/**
	* Change payed status
	* 
	*/
	
	function changePayedStatus($value){
		$result = '';
		switch ($value) {
			case 1:
			$result = '<span class="badge badge-success">Đã thanh toán</span>';
			break;
			default:
			$result = '<span class="badge badge-warning">Chưa thanh toán</span>';
			break;
		}
		return $result;
	}
	
	/**
	* Convert Date to String
	* 
	*/
	function convertToStringDate($oldDate){
		if(is_null($oldDate)){
			return "";
		}
		return Carbon::createFromFormat('Y-m-d', trim($oldDate))->format('d/m/Y');
	}
	
	/**
	* Change label name for ExecComm level
	* 
	*/
	function changeLevelLabel($levelCode, $commType){
		$result = '';
		// commType = "0" BCH Đoàn
		// commType = "1" BCH LCH
		switch ($levelCode) {
			case 1:
			if($commType == "0"){
				$result = '<span class="badge badge-primary">Bí thư</span>';
			}else {
				$result = '<span class="badge badge-primary">LCH Trưởng</span>';
			}
			break;
			case 2:
			if($commType == "0"){
				$result = '<span class="badge badge-success">Phó bí thư</span>';
			}else {
				$result = '<span class="badge badge-success">LCH Phó</span>';
			}
			break;
			case 3:
			$result = '<span class="badge badge-success">Phó bí thư (LCH Trưởng)</span>';
			break;
			case 0:
			$result = '<span class="badge badge-info">Ủy viên BCH</span>';
			break;
			default:
			$result = '<span class="badge badge-info">CTV</span>';
			break;
		}
		return $result;
	}
	
	/**
	* Change activity status by begin date and end date
	* 
	*/
	function changeActivityStatus($beginDate, $endDate){
		$now =  new DateTime(date("Y-m-d H:i:s"));
		$begin = new DateTime($beginDate);
		$end = new DateTime($endDate);
		$result ='';
		if($now > $begin && $now > $end){
			$result = '<span class="badge badge-info">Đã diễn ra</span>';
		} else if ( ($now >= $begin && $now <= $end)){
			$result = '<span class="badge badge-primary">Đang diễn ra</span>';
		} else{
			$result = '<span class="badge badge-success">Chưa diễn ra</span>';
		}
		return $result;
	}
	
	function changeProgressbarColor($progress){
		$result = '';
		if($progress >= 1 && $progress <= 50){
			$result = 'bg-warning';
		} else if($progress >= 50 && $progress <= 80){
			$result = 'bg-info';
		} else if($progress >= 80 && $progress <= 100){
			$result = 'bg-success';
		}
		return $result;
	}
	
	function changeCatColor($color){
		$class ='';
		if($color == 1 || $color == 3 || $color == 5 || $color == 7 || $color == 9) {
			$class = 'cat-1';
		}if($color == 11 || $color == 13 || $color == 15 || $color == 17 || $color == 19) {
			$class = 'cat-2';
		}if($color == 21 || $color == 23 || $color == 25) {
			$class = 'cat-3';
		}if($color == 2 || $color == 4 || $color == 6 || $color == 8 || $color == 10) {
			$class = 'cat-4';
		}if($color == 12 || $color == 14 || $color == 16 || $color == 18) {
			$class = 'cat-5';
		}if($color == 20 || $color == 22 || $color == 24) {
			$class = 'cat-7';
		}
		return $class;
	}
	
	// Change month number to string format
	function numberToStringMonth($month){
		$result = "";
		switch ($month) {
			case '1':
			$result = 'January';
			break;
			case '2':
			$result = 'February';
			break;
			case '3':
			$result = 'March';
			break;
			case '4':
			$result = 'April';
			break;
			case '5':
			$result = 'May';
			break;
			case '6':
			$result = 'June';
			break;
			case '7':
			$result = 'July';
			break;
			case '8':
			$result = 'August';
			break;
			case '9':
			$result = 'September';
			break;
			case '10':
			$result = 'October';
			break;
			case '11':
			$result = 'November';
			break;
			default:
			$result = 'December';
			break;
		}
		return $result;
	}
	?>