<?php

namespace App\Http\Controllers\Admin;

use App\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Http\Requests\Admin\ProductRequest;
use App\User;
use App\Category;
use App\Exports\WarehouseExport;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Auth;

class WarehouseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /*if(request()->ajax())
        {
            if($request->category)
            {
                   $query = Product::with(['category'])
                    ->where('product.category', $request->category);
            }
            else
            {
                    $query = Product::with(['category']);
                   
            }

                return Datatables::of($query)
                ->make();
        }


            $users = User::all();
        $categories = Category::all();
        return view('pages.admin.warehouse.index', [
            'users' => $users,
            'categories' => $categories
        ]);*/
            
        if (request()->ajax()) 
        {

            $query = Product::with(['category']);
            return Datatables::of($query)
            /*->filter(function ($instance) use ($request) 
            {
                if ($request->get('filter_category') == '0' || $request->get('filter_category') == '1') 
                {
                    $instance->where('filter_category', $request->get('filter_category'));
                }
            }) */
                ->make();

            /*if($request->category)
            {
                $query = Product::with(['category']);
                return Datatables::of($query)
                ->where('product.category', $request->category)
                ->make();
            }
            else
            {
                $query = Product::with(['category']);
            return Datatables::of($query)
                ->make();
            }*/
            
        }

        $users = User::all();
        $categories = Category::all();
        return view('pages.admin.warehouse.index', [
            'users' => $users,
            'categories' => $categories
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product=\DB::table('products')->where('id', $id)->first();
        $stock_available= Product::where('stock_available')->first();
        $transaction_status = $transactions->transaction_status->get();
        dd($transaction_status);

        /*
        if($transaction_status!="PENDING")
        {
            $updateStock=$stock_available - 1;
        }
    

        \DB::table('products')->where('id', $id)->update([
            'stock_available' => $updateStock
        ]);
        */
    }

    
     /* Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function print()
    {
        $products = Product::all();
        $users = User::all();
        $categories = Category::all();
        return view('pages.admin.warehouse.print', [
            'products'=>$products,
            'users' => $users,
            'categories' => $categories
        ]); 
    }

    public function warehouseExport()
    {
        return Excel::download(new WarehouseExport, 'Warehouse.xlsx');
    }

    public function filter()
    {
        $categories=Category::all();
        $name = $categories->sortBy('name')->pluck('name')->unique();
        return view ('pages.admin.warehouse.index');
    }


   /* public function data(Request $request, $jenis)
    {
        $jenis =  str_replace ('-', '', $jenis); 
        $data = Product ::select(
        [
            'product.*'
        ]);

        if($request->input('category')!==null)
        {
            $data=$data->where('category_id', $request->category)
        }

    }
    */
}


