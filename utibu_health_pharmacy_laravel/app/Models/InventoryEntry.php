<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class InventoryEntry extends Model
{
    use HasFactory;

    protected $fillable = [
        'inv_id',
        'name',
        'category',
        'price',
        'quantity_in_stock',
        'description',
        'status',
    ];
    public function user ():BelongsTo
    {
        return $this->belongsTo(User::class);

}
}