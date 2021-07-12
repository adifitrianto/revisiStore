<?php

namespace App\Http\Controllers;

use App\Transaction;
use App\TransactionDetail;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardTransactionController extends Controller
{
    public function index()
    {
        $transactions = User::find(Auth::user()->id)->transactions;

        return view('pages.dashboard-transactions', compact('transactions'));
    }

    // public function index()
    // {
    //     return view('pages.dashboard-transactions');
    // }

    public function details($id)
    {
        $transaction = Transaction::find($id);

        return view('pages.dashboard-transactions-details', compact('transaction'));
    }

    public function update(Request $request)
    {
        $transaction = Transaction::find($request->transaction_id);

        $transaction->payment_image = $request->file('photos')->store('assets/payment', 'public');
        $transaction->transaction_status = 'CONFIRMED';
        $transaction->save();

        return redirect()->route('dashboard-transaction');
    }
}
