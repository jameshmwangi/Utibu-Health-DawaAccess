<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\InventoryEntry;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class InventoryController extends Controller
{
    // List all inventory entries
    public function index()
    {
        
        $inventory = InventoryEntry::all();
        return response()->json($inventory);
    }

    // Create a new inventory entry
    public function store(Request $request)
    {
        if (!Gate::allows('admin-access')) {
            abort(403);
        }
        
        $request->validate([
            'name' => 'required|string|max:255',
    'category' => 'required|in:capsules,pills,syrup,cream',
           
            'price' => 'required|numeric',
            'quantity_in_stock' => 'required|integer',
            'description' => 'nullable|string',
            'status' => 'required|string',
        ]);

        $entry = new InventoryEntry($request->all());
        $entry->user_id = Auth::id(); // Assuming the user is authenticated
        $entry->save();

        return response()->json($entry, 201);
    }

    // Update an existing inventory entry
    public function update(Request $request, $inv_id)
    {
        if (!Gate::allows('admin-access')) {
            abort(403);
        }
        $entry = InventoryEntry::findOrFail($inv_id);

        $entry->update($request->all());

        return response()->json($entry);
    }

    // Place an order for an inventory item
    public function placeOrder($inv_id, $quantity)
    {
        $entry = InventoryEntry::findOrFail($inv_id);

        if ($entry->quantity_in_stock < $quantity) {
            return response()->json(['message' => 'Insufficient stock'], 400);
        }

        $entry->decrement('quantity_in_stock', $quantity);
        // Here you would likely want to create an actual order record or perform additional actions

        return response()->json(['message' => 'Order placed successfully']);
    }
}
