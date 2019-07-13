<?php

namespace App\Http\Middleware;

use Closure;

class StatisticalManagementRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $request->user()->authorizeRoles([config('constants.TT')]);
        return $next($request);
    }
}
