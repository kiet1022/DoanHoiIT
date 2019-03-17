<?php

use Illuminate\Database\Seeder;

class StudentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('students')->insert([
            [
                'student_id'=>'15110237',
                'name'=>'Dương Tuấn Kiệt',
                'class_id'=>1,
                'school_year_id'=>1,
                'address'=>'Binh Phuoc',
                'birthday'=>'1997-08-08',
                'sex'=>1,
                'phone_no'=>1234567,
                'is_youth_union_member'=>1,
                'is_study'=>1,
                'is_payed_union_fee'=>1,
                'created_at'=>date("Y-m-d")
            ]
        ]);
    }
}
