<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;

use App\SchoolYear;
use App\Classes;
use App\Province;
use App\District;
use App\Ward;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        $data["schoolYears"] = SchoolYear::where('type',2)->get();
        $data["class"] = Classes::all();
        $data["province"] = Province::all();
        $data["district"] = District::all();
        $data["ward"] = Ward::all();
        View::share('data',$data);
    }
}
