<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddMarksRequest extends FormRequest
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
            'content'=>"required",
            'type'=>'required',
            'marks'=>'required'
        ];
    }

    public function messages(){
        return [
            'content.required' => 'Bạn chưa nhập nội dung của danh sách',
            'type.required' => 'Bạn chưa chọn loại điểm cộng',
            'marks.required' => 'Bạn chưa nhập số điểm'
        ];
    }
}
