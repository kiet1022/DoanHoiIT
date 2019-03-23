<?php

namespace App\Http\Requests;
use Validator;
use Illuminate\Foundation\Http\FormRequest;

class AddProgramRequest extends FormRequest
{
    /**
    * Determine if the user is authorized to make this request.
    *
    * @return bool
    */
    public function authorize()
    {
        return true;
    }
    
    /**
    * Get the validation rules that apply to the request.
    *
    * @return array
    */
    public function rules()
    {
        
        return [
            'start' => 'required|min:'.date("Y"),
            'end' =>'required|min:'.date("Y"),
            'studentBirthday' => 'required|bail|size:10|date',
            'unionDate' => 'bail|nullable|size:10|date',
            'studentShoolYear' => 'required|size:1',
            'studentClass' => 'required|size:1',
            'studentSex' => [
                function ($attribute, $value, $fail) {
                    if (!in_array($value, [
                        config('constants.MALE_OPTION'), 
                        config('constants.FEMALE_OPTION'), 
                        config('constants.OTHER_GENDER_OPTION')
                        ])) {
                        return $fail('Giới tính không hợp lệ.');
                    }
                },
                'numeric',
                'required'
            ],
            'isStudy' => [
                function ($attribute, $value, $fail) {
                    if (!in_array($value, [
                        config('constants.STUDY_STATUS_STUDYING'), 
                        config('constants.STUDY_STATUS_GRADUATED'), 
                        config('constants.STUDY_STATUS_RESERVED'),
                        config('constants.STUDY_STATUS_LEAVED_SCHOOL')
                        ])) {
                        return $fail('Tình trạng học tập không hợp lệ.');
                    }
                },
                'numeric',
                'required',
            ],
        ];
    }
    
    /**
     * Get the messages when validate failed
     * 
     * @return array
     */
    public function messages(){
        return [
            'start.required' => 'Bạn chưa chọn :attribute.',
            
        ];
    }
}
