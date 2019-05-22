<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddNewActivityRequest extends FormRequest
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
            'name' => 'required',
            'leader' => 'required',
            'year' => 'required',
            'semester' => 'required',
            'startDate' => 'required|date_format:d/m/Y',
            'endDate' => 'required|date_format:d/m/Y|after_or_equal:startDate',
            'startRegisDate' => 'required|date_format:d/m/Y|before:startDate',
            'endRegisDate' => 'required|date_format:d/m/Y|after_or_equal:startRegisDate',
            'planUrl' => 'mimes:docx,doc',
            'fundUrl' => 'mimes:docx,doc'
        ];
    }

    /**
    * Get the message after validation false
    *
    * @return array
    */
    public function messages(){
        return [
            'name.required' => 'Chưa nhập tên chương trình',
            'leader.required' => 'Chưa chỉ định người đứng chính',
            'year.required' => 'Năm học không được để trống',
            'semester.required' => 'Học kỳ không được để trống',
            'startDate.required' => 'Ngày bắt đầu không được bỏ trống',
            'startDate.date_format' => 'Vui lòng nhập đúng định dạng dd/mm/yyyy',
            'endDate.required' => 'Ngày kết thúc không được bỏ trống',
            'endDate.date_format' => 'Vui lòng nhập đúng định dạng dd/mm/yyyy',
            'endDate.after_or_equal' => 'Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu',
            'startRegisDate.required' => 'Ngày bắt đầu đăng kí không được bỏ trống',
            'startRegisDate.before' => 'Ngày bắt đầu đăng kí không được lớn hơn ngày diễn ra chương trình',
            'startRegisDate.date_format' => 'Vui lòng nhập đúng định dạng dd/mm/yyyy',
            'endRegisDate.required' => 'Ngày kết thúc đăng kí không được bỏ trống',
            'endRegisDate.after_or_equal' => 'Ngày kết thúc đăng kí phải lớn hơn hoặc bằng ngày bắt đầu đăng kí',
            'endRegisDate.date_format' => 'Vui lòng nhập đúng định dạng dd/mm/yyyy',
            'planUrl.mimes' => 'Vui lòng chọn đúng định dạng file (doc, docx)',
            'fundUrl.mimes' => 'Vui lòng chọn đúng định dạng file (doc, docx)'
        ];
    }
}
