<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Cart;
use App\Product;
use App\Transaction;
use App\TransactionDetail;

use Exception;

use Midtrans\Snap;
use Midtrans\Config;

class CheckoutController extends Controller
{
  public function process(Request $request)
  {
    // save user data
    $user = Auth::user();
    $user->update($request->except('total_price'));

    // checkout process
    $code = 'STORE-' . mt_rand(000, 999);
    $carts = Cart::with(['product', 'user'])
      ->where('users_id', Auth::user()->id)
      ->get();

    // transaction create
    $transaction = Transaction::create([
      'users_id' => Auth::user()->id,
      'inscurance_price' => 0,
      'shipping_price' => 0,
      'total_price' => $request->total_price,
      'transaction_status' => 'PENDING',
      'code' => $code,
    ]);

    foreach ($carts as $cart) {
      $trx = 'TRX-' . mt_rand(000, 999);

      TransactionDetail::create([
        'transaction_id' => $transaction->id,
        'products_id' => $cart->product->id,
        'price' => $cart->product->price,
        'shipping_status' => 'PENDING',
        'resi' => '',
        'code' => $trx,
      ]);
    }

    //delete cart
    Cart::where('users_id', Auth::user()->id)
      ->delete();

    // midtrans config
    // Set your Merchant Server Key
    Config::$serverKey = config('services.midtrans.serverKey');
    // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
    Config::$isProduction = config('services.midtrans.isProduction');
    // Set sanitization on (default)
    Config::$isSanitized = config('services.midtrans.isSanitized');
    // Set 3DS transaction for credit card to true
    Config::$is3ds = config('services.midtrans.is3ds');


    // midtrans array
    $midtrans = [
      'transaction_details' => [
        'order_id' => $code,
        'gross_amount' => (int) $request->total_price,
      ],
      'customer_details' => [
        'first_name' => Auth::user()->name,
        'email' => Auth::user()->email,

      ],
      'enable_payments' => [
        'gopay', 'permata_va', 'bank_transfer'
      ],
      'vtweb' => []
    ];

    // product decrement
    Product::where('id', $cart->product['id'])->decrement('stock_available');

    try {
      // Get Snap Payment Page URL
      $paymentUrl = Snap::createTransaction($midtrans)->redirect_url;

      // Redirect to Snap Payment Page
      return redirect($paymentUrl);
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  public function callback(Request $request)
  {
  }
}
