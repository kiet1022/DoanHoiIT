<?php

namespace App\Http\Requests;
use Validator;
use Illuminate\Foundation\Http\FormRequest;

class EditStudentRequest extends FormRequest
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
            'studentName' =>'required|between:3, 50',
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

    public function messages(){
        return [
            'studentSex.required' => 'Bạn chưa chọn :attribute.',
            'studentSex.numeric' => 'Giá trị của :attribute phải là số.',
            'email.email'=>':attribute không hợp lệ.',
            'sid.numeric' => ':attribute phải là số.',
            'studentName.between' => ':attribute phải từ :min đến :max kí tự.',
            'sid.digits_between' => ':attribute phải từ :min đến :max ký tự.',
            'studentShoolYear.required' => 'Bạn chưa chọn :attribute.',
            'studentShoolYear.size' => ':attribute không hợp lệ.',
            'studentClass.required' => 'Bạn chưa chọn :attribute.',
            'studentClass.size' => ':attribute không hợp lệ.',
            'studentBirthday.size' => ':attribute không hợp lệ.',
            'studentBirthday.date' => 'Định dạng :attribute không hợp lệ.',
            'unionDate.size' => ':attribute không hợp lệ.',
            'unionDate.date' => 'Định dạng :attribute không hợp lệ.',
            
        ];
    }
}
