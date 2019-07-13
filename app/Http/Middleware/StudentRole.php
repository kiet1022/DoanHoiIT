<?php

namespace App\Http\Middleware;

use Closure;

class StudentRole
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
        $request->user()->authorizeRoles([config('constants.STUDENT_ROLE')]);
        return $next($request);
    }
}
