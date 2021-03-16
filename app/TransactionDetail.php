<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TransactionDetail extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'transaction_id',
        'transactions_id',
        'products_id',
        'price',
        'resi',
        'shipping_status',
        'code',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'products_id');
    }

    public function Transaction()
    {
        return $this->hasOne(Transaction::class, 'id', 'transactions_id');
    }
}
