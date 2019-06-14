<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class WorkFlowDetail extends Model
{
    protected $table = "workflow_details";
    use SoftDeletes;
    public function ofWorkflow()
    {
    	return $this->belongsTo('App\Models\WorkFlow','workflow_id','id');
    }
}
