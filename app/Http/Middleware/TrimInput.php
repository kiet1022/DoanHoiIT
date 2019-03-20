<?php

namespace App\Http\Middleware;

use Closure;

class TrimInput
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
        $input = $request->all();

        //dd($input["unionDate"]);

        return $next($request);
    }
}
