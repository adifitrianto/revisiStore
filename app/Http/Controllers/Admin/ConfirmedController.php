<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ConfirmedController extends Controller
{
    public function index()
    {
    	if (request()->ajax()) {
            $query = transaction();

            return Datatables::of($query)
                ->editColumn('photos', function ($item) {
                    return $item->photos ? '<img src="' . Storage::url($item->photos) . '" style="max-height: 80px;" />' : '';
                })
               
                ->make();
        }

        return view('pages.admin.confirmed.index');
    }

    public function store(Confirmed $request)
    {
        $data = $request->all();

        $data['photos'] = $request->file('photos')->store('assets/product', 'public');

        Confirmed::create($data);

        return redirect()->route('dashboard-transactions');
    }
}
