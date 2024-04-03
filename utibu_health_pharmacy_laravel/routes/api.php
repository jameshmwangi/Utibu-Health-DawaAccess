<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;



use App\Http\Controllers\InventoryController;

// List inventory entries
Route::get('/inventory', [InventoryController::class, 'index']);

// Create a new inventory entry
Route::post('/inventory', [InventoryController::class, 'store']);

// Update an inventory entry
Route::put('/inventory/{inv_id}', [InventoryController::class, 'update']);

// Place an order
Route::post('/inventory/{inv_id}/order/{quantity}', [InventoryController::class, 'placeOrder']);

Route::post('/login', [UsersController::class, 'login']);

Route::post('/register', [UsersController::class, 'register']);


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
