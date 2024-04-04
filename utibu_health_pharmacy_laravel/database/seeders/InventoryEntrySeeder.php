<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\InventoryEntry;

class InventoryEntrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = ['capsules', 'pills', 'syrup', 'cream']; // Valid categories
        $statusOptions = ['available', 'out_of_stock']; // Example status options

        // Assuming user with ID 2 exists and is an admin
        $adminUserId = 2;

        // Generate 10 inventory entries
        for ($i = 0; $i < 10; $i++) {
            InventoryEntry::create([
                'user_id' => $adminUserId, // Use admin user ID
                'name' => fake()->words(3, true), // Generates a string of 3 words
                'category' => fake()->randomElement($categories), // Random category
                'price' => fake()->randomFloat(2, 5, 100), // Random price between 5 and 100 with 2 decimal places
                'quantity_in_stock' => fake()->numberBetween(0, 100), // Random quantity between 0 and 100
                'description' => fake()->sentence(), // Random sentence
                'status' => fake()->randomElement($statusOptions), // Random status
            ]);
        }
    }
}
