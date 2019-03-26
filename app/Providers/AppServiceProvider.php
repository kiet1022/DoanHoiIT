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

        $this->data["schoolYears"] = SchoolYear::where('type',2)->get();
        $this->data["class"] = Classes::all();
        $this->data["province"] = Province::all();
        $this->data["district"] = District::all();
        $this->data["ward"] = Ward::all();
        View::share($this->data);
    }
}
