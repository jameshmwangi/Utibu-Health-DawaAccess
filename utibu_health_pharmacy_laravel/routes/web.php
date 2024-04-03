<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InventoryController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/inventory', [InventoryController::class, 'index'])->name('admin.index');
Route::post('/inventory', [InventoryController::class, 'store'])->name('inventory.store');
// Add routes for show, update, and delete as needed


Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
