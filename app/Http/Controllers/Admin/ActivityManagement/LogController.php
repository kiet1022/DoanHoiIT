<?php

namespace App\Http\Controllers\Admin\ActivityManagement;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Log;
use DateTimeUtil;
use StringUtil;
class LogController extends Controller
{
    /**
     * Get Activities History
     */
    public function getActivityLog(Request $req){
        // Check user role
        // forget old date if it exist
        session()->forget('_old_input');

        $curentDate =  date("Y-m-d H:i:s");
        $this->data['logs'] = Log::whereBetween('time_id', [date($curentDate), date($curentDate)])->get();
        return view('admin.log.logs')->with($this->data);
    }

    /**
     * Filter Activities History
     * 
     * @param $req Request
     */
    public function filterActivityLog(Request $req){
        // Check user role
        $beginDate = DateTimeUtil::convertToYmd($req->beginDate);
        $endDate = DateTimeUtil::convertToYmd($req->endDate);
        //return $beginDate." ".$endDate;
        $this->data['logs'] = Log::whereBetween('time_id', [date($beginDate), date($endDate)])->get();
       // return $this->data['logs'];
        // set session to old Input
        $req->flash();
        return view('admin.log.logs')->with($this->data);
    }
}
