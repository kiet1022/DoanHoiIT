<?php

namespace App\Exports;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;
use App\CheckinDetail;
class MarksExport implements FromView
{
    use Exportable;
    private $details;

    public function __construct($data){
        $this->details = $data;
    }

    public function view(): View
    {
        return view('admin.excel_export_template.marks_template', [
            'details' => $this->details
        ]);
    }
    
}
