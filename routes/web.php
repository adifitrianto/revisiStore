<?php

use App\Product;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index')->name('home');

Route::get('/categories', 'CategoryController@index')->name('categories');
Route::get('/categories/{id}', 'CategoryController@detail')->name('categories-detail');

Route::get('/details/{id}', 'DetailController@index')->name('detail');
Route::post('/details/{id}', 'DetailController@add')->name('detail-add');

Route::post('/checkout/callback', 'CheckoutController@callback')->name('midtrans-callback');

Route::get('/success', 'CartController@success')->name('success');          //transaksi berhasil

Route::get('/register/success', 'Auth\RegisterController@success')->name('register-success');           //registrasi berhasil


Route::group(['middleware' => ['auth']], function () {
    Route::get('/cart', 'CartController@index')->name('cart');
    Route::delete('/cart/{id}', 'CartController@delete')->name('cart-delete');

    Route::post('/checkout', 'CheckoutController@process')->name('checkout');

    Route::get('/dashboard', 'DashboardController@index')->name('dashboard');

    Route::get('/dashboard/products', 'DashboardProductController@index')->name('dashboard-product');
    Route::get('/dashboard/products/{id}', 'DashboardProductController@details')->name('dashboard-product-details');
    Route::get('/dashboard/products/create', 'DashboardProductController@create')->name('dashboard-product-create');

    Route::get('/dashboard/transactions', 'DashboardTransactionController@index')->name('dashboard-transaction');
    Route::get('/dashboard/transactions/{id}', 'DashboardTransactionController@details')->name('dashboard-transaction-details');

    Route::get('/dashboard/settings', 'DashboardSettingController@store')->name('dashboard-settings-store');
    Route::get('/dashboard/account', 'DashboardSettingController@account')->name('dashboard-settings-account');
    Route::post('/dashboard/account/{redirect}', 'DashboardSettingController@update')->name('dashboard-settings-redirect');
});

//
Route::prefix('admin')
    ->namespace('Admin')
    ->middleware(['auth', 'admin'])
    ->group(function () {
        Route::get('/', 'DashboardController@index')->name('admin-dashboard');
        Route::resource('category', 'CategoryController');
        Route::resource('user', 'UserController');
        Route::resource('product', 'ProductController');
        Route::resource('product-gallery', 'ProductGalleryController');
        Route::resource('transaction', 'TransactionController');
        Route::resource('confirmed', 'ConfirmedController');
        Route::get('warehouse/print', 'WarehouseController@print')->name('print');
        Route::get('warehouse/warehouseExport', 'WarehouseController@warehouseExport')->name('warehouseExport');
        Route::get('warehouse/filter', 'WarehouseController@filter')->name('filter');
        Route::resource('warehouse', 'WarehouseController');
           Route::any('/warehouse/data/{jenis}', 'WarehouseController@data');
    });

Auth::routes();

Route::get('datatable', function () {
  return view('datatable', ['produk' => Product::where('stock_available', "!=", 0)->get()]);
});

