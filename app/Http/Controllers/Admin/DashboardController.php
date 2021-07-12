<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\User;
use App\Transaction;
use App\TransactionDetail;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $customer = User::count();
        $revenue = Transaction::sum('total_price');
        $transactionCount = Transaction::count();

        $transactions = TransactionDetail::with(['transaction.user', 'product.galleries'])
            ->has('transaction')
            ->orderBy("created_at", "DESC");

        

        return view('pages.admin.dashboard', [
            'customer' => $customer,
            'revenue' => $revenue,
            'transaction' => $transactionCount,
            'transaction_data' => $transactions->get()
        ]);
    }
}
