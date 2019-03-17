<?php

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

/**
 * Change gender for select
 */
function changeGenderForSelect($gender){
	$option = '';
	if($gender == 0){
		$option = '<option value="0" selected>Nam</option><option value="1">Nữ</option><option value="3">Khác</option>';
	}if($gender == 1){
		$option = '<option value="0">Nam</option><option value="1" selected>Nữ</option><option value="3">Khác</option>';
	}if($gender == 2){
		$option = '<option value="0">Nam</option><option value="1">Nữ</option><option value="3" selected>Khác</option>';
	}
	return $option;
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

function changeRole($role){
	$result = '';
	if($role == 1){
		$result = 'Quản trị viên';
	}if($role == 0){
		$result = 'Thành viên';
	}
	return $result;
}
function changeCorrectAnswerColor($answer, $correctAnswer){
	$result = '';
	if(trim($answer) == trim($correctAnswer)){
		$result = 'data-toggle="tooltip" title="Đáp án đúng" data-placement="top" class="text-danger"';
	}
	return $result;
}

function changeSelectedCorrectAnswer($question){
	$option = '';
	if(trim($question->a) == trim($question->correct_answer)){
		$option = '<option value="A" selected>'.$question->a.'</option><option value="B">'.$question->b.'</option><option value="C">'.$question->c.'</option><option value="D">'.$question->d.'</option>';
	}
	if(trim($question->b) == trim($question->correct_answer)){
		$option = '<option value="A">'.$question->a.'</option><option value="B" selected>'.$question->b.'</option><option value="C">'.$question->c.'</option><option value="D">'.$question->d.'</option>';
	}
	if(trim($question->c) == trim($question->correct_answer)){
		$option = '<option value="A">'.$question->a.'</option><option value="B">'.$question->b.'</option><option value="C" selected>'.$question->c.'</option><option value="D">'.$question->d.'</option>';
	}
	if(trim($question->d) == trim($question->correct_answer)){
		$option = '<option value="A">'.$question->a.'</option><option value="B">'.$question->b.'</option><option value="C">'.$question->c.'</option><option value="D" selected>'.$question->d.'</option>';
	}
	return $option;
}

function checkYourAnswer($option, $answer){
	$result = "disabled";
	if(trim($answer) == trim($option)) {
		$result = "checked";
	}
	return $result;
}

function checkCorrectQuestion($answer, $corect){
	$result ="";
	if(trim($answer) == trim($corect)){
		$result = '<span style="color: #29ca8e; margin-left: 10px;"><i class="fa fa-check"></i></span>';
	}
	return $result;
}

function showHours($time){
	$result = 0;
	if($time == 60){
		$result = 1;
	}
	return $result;
}

function showMinutes($time){
	$result = 0;
	if($time == 60){
		$result = 60;
	}
	if($time == 30){
		$result = 30;
	}
	if($time == 20){
		$result = 20;
	}
	return $result;
}

function checkCorrectQuestionForEditTest($answer, $correct){
	$result='';
	if($answer == $correct){
		$result = 'checked';
	}
	return $result;
}

?>