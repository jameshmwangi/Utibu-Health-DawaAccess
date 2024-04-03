<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('inventory_entries', function (Blueprint $table) {
            $table->id('inv_id');
            $table->unsignedBigInteger('user_id'); // Assuming you are tracking which user created the entry.
            $table->string('name');
            $table->enum('category', ['capsules', 'pills', 'syrup', 'cream']);
            $table->decimal('price', 8, 2);
            $table->integer('quantity_in_stock');
            $table->text('description')->nullable();
            $table->string('status');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventory_entries');
    }
};
