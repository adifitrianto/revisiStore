<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name', 'users_id', 'categories_id', 'price', 'description', 'slug', 'stock_total', 'stock_available'
    ];

    protected $hidden = [];

    protected $appends = ['quantity', 'image'];

    public function galleries()
    {
        return $this->hasMany(ProductGallery::class, 'products_id', 'id');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'users_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'categories_id', 'id');
    }

    function getQuantityAttribute()
    {
        return sprintf('%s / %s', $this->stock_available, $this->stock_total);
    }

    function getImageAttribute()
    {
        return $this->galleries()->first()->photos;
    }
}
