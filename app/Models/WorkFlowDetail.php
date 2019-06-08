<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkFlowDetail extends Model
{
    protected $table = "workflow_details";

    public function ofWorkflow()
    {
    	return $this->belongsTo('App\Models\WorkFlow','workflow_id','id');
    }
}
