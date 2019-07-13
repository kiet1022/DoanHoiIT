<?php

namespace App\Http\Middleware;

use Closure;

class NewsManagementRole
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
        $request->user()->authorizeRoles([config('constants.TT'), config('constants.UVBCH')]);
        return $next($request);
    }
}
