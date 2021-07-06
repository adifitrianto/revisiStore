<?php

namespace App\Exports;

use App\Product;
use App\Category;
use App\User;
use Maatwebsite\Excel\Concerns\FromCollection;

class WarehouseExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Product::all();
    }
}
