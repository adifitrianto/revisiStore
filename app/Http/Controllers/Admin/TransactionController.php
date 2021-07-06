<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Transaction;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

use App\TransactionDetail;
use Illuminate\Support\Facades\Auth;


class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $transactions = TransactionDetail::with(['transaction.user', 'product.galleries'])
        //     ->whereHas('product', function ($product) {
        //         $product->where('users_id', Auth::user()->id);
        //     });

        // return view('pages.admin.transaction.index', [
        //     'transaction_data' => $transactions->get(),
        // ]);


        $transactions = Transaction::all();
        return view('pages.admin.transaction.index', compact('transactions'));
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
    public function edit(Request $request, $id)
    {
        $transaction = Transaction::findOrFail($id);
        // dd($item, $transaction);

        return view('pages.admin.transaction.detail', compact('transaction'));

        // return dd($item, $transaction);
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

        $data = $request->all();
        $item = Transaction::findOrFail($id);

        $item->update($data);

        $transactions = Transaction::all();
        return view('pages.admin.transaction.index', compact('transactions'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Transaction::findorFail($id);
        $item->delete();

        return redirect()->route('transaction.index');
    }
}