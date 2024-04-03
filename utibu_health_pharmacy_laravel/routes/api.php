<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;



use App\Http\Controllers\InventoryController;




Route::post('/login', [UsersController::class, 'login']);
Route::post('/register', [UsersController::class, 'register']);

Route::middleware(['auth:sanctum', 'api'])->group(function() {

    Route::get('/user', function (Request $request) {
        return $request->user();
    });

     // Only admin users can create a new inventory entry
     Route::post('/inventory', [InventoryController::class, 'store'])
     ->middleware('can:admin-access');

// Only admin users can update an inventory entry
Route::put('/inventory/{inv_id}', [InventoryController::class, 'update'])
     ->middleware('can:admin-access');

    // Update an inventory entry
    Route::put('/inventory/{inv_id}', [InventoryController::class, 'update']);

    // Place an order for an inventory item
    Route::post('/inventory/{inv_id}/order/{quantity}', [InventoryController::class, 'placeOrder']);
});

