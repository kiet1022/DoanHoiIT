<?php

use Illuminate\Database\Seeder;

class SchoolYearTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('school_years')->insert([
            [
                'name'=>'2015 - 2019',
                'type' => 2
            ],
            [
                'name'=>'2016 - 2020',
                'type' => 2
            ],
            [
                'name'=>'2017 - 2021',
                'type' => 2
            ],
            [
                'name'=>'2018 - 2022',
                'type' => 2
            ],
            [
                'name'=>'2015 - 2016',
                'type' => 1
            ],
            [
                'name'=>'2016 - 2017',
                'type' => 1
            ],
            [
                'name'=>'2017 - 2018',
                'type' => 1
            ],
            [
                'name'=>'2018 - 2019',
                'type' => 1
            ]
        ]);
    }
}
