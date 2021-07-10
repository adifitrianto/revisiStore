<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ConfirmedController extends Controller
{
    public function index()
    {
        if (request()->ajax()) {
            $query = Transaction::where('transaction_status', 'CONFIRMED')->get();

            return datatables()::of($query)
                ->addColumn('action', function ($item) {
                    return '
                        <a href=' . route('confirmed.edit', $item->id) . ' class="btn btn-primary text-white">
                            Cek
                        </a>
                ';
                })
                ->editColumn('photos', function ($item) {
                    return $item->payment_image ? '<img src="' . Storage::url($item->payment_image) . '" style="max-height: 80px;" />' : '';
                })
                ->rawColumns(['action', 'photos'])
                ->make();
        }

        return view('pages.admin.confirmed.index');
    }

    public function edit($id)
    {
        $transaction = Transaction::find($id);
        $payment_image_path = Storage::url($transaction->payment_image);

        return view('pages.admin.confirmed.edit', compact(['transaction', 'payment_image_path']));
    }

    public function update($id, Request $request)
    {
        $transaction = Transaction::find($id);
        if ($request->action == 'valid') {
            $transaction->transaction_status = 'PAID';
        } else if ($_POST['action'] == 'Delete') {
            $transaction->transaction_status = 'PENDING';
        } else {
            abort(500);
        }
        $transaction->save();

        return view('pages.admin.confirmed.index');
    }
}
