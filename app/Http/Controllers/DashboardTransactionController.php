<?php

namespace App\Http\Controllers;

use App\TransactionDetail;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardTransactionController extends Controller
{
    public function index()
    {
        $transactions = TransactionDetail::with(['transaction.user', 'product.galleries'])
            ->whereHas('product', function ($product) {
                $product->where('users_id', Auth::user()->id);
            });

        $revenue = $transactions->get()->reduce(function ($carry, $item) {
            return $carry + $item->price;
        });

        $customer = User::count();

        return view('pages.dashboard-transactions', [
            'transaction_count' => $transactions->count(),
            'transaction_data' => $transactions->get(),
            'revenue' => $revenue,
            'customer' => $customer,
        ]);
    }

    // public function index()
    // {
    //     return view('pages.dashboard-transactions');
    // }

    public function details()
    {
        return view('pages.dashboard-transactions-details');
    }
}