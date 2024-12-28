<?php

namespace Database\Seeders;

use App\Models\Company;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Membuat 3 perusahaan
        $companies = [
            [
                'company_name' => 'Alphawave Inc.',
                'description' => 'Leading technology solutions provider.',
                'photo' => null,
                'address' => '123 Main Street',
                'latitude' => 40.7128,
                'longitude' => -74.0060,
                'working_hour_start' => '08:00',
                'working_hour_end' => '17:00',
                'status' => 'Active',
            ],
            [
                'company_name' => 'InnovateHub Ltd.',
                'description' => 'Driving innovation in various industries.',
                'photo' => null,
                'address' => '456 Elm Street',
                'latitude' => 34.0522,
                'longitude' => -118.2437,
                'working_hour_start' => '09:00',
                'working_hour_end' => '18:00',
                'status' => 'Active',
            ],
        ];

        foreach ($companies as $companyData) {
            // Membuat perusahaan
            $company = Company::create($companyData);

            // Membuat user HRD untuk perusahaan
            for ($i = 1; $i <= 2; $i++) {
                User::create([
                    'name' => 'HRD ' . $i,
                    'email' => "hrd$i." . str_replace([' ', '.'], '', strtolower($company->company_name)) . "@demo.com",
                    'password' => bcrypt('123456'),
                    'company_id' => $company->id,
                    'role' => 'HRD',
                    'department' => 'IT',
                    'photo' => null,
                    'status' => 'Active',
                ]);
            }

            // Membuat user Employee untuk perusahaan
            for ($i = 1; $i <= 10; $i++) {
                User::create([
                    'name' => 'User ' . $i,
                    'email' => "user$i." . str_replace([' ', '.'], '', strtolower($company->company_name)) . "@demo.com",
                    'password' => bcrypt('123456'),
                    'company_id' => $company->id,
                    'role' => 'Employee',
                    'department' => 'IT',
                    'photo' => null,
                    'status' => 'Active',
                ]);
            }
        }
    }
}
    