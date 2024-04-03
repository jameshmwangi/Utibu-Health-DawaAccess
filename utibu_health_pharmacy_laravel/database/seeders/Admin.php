<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class Admin extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Admin',
            'email' => 'admin@utibuhealth.com',
            'email_verified_at' => now(),
            'password' => Hash::make('L1nD@Afy0Yak*!'), // Strong password
            'remember_token' => Str::random(10),
            'is_admin' => 1,
        ]);
        
    }
}
