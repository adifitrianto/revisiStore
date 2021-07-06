<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('register/check', 'Auth\RegisterController@check')->name('api-register-check');
Route::get('provinces', 'API\LocationController@provinces')->name('api-provinces');
Route::get('regencies/{provinces_id}', 'API\LocationController@regencies')->name('api-regencies');

Route::get('table/product', function () {
  $products = Product::all();
  foreach ($products as $key => $product) {
    $data[$key]["categories_id"] = $product["categories_id"];
    $data[$key]["created_at"] = $product["created_at"];
    $data[$key]["deleted_at"] = $product["deleted_at"];
    $data[$key]["description"] = $product["description"];
    $data[$key]["id"] = $product["id"];
    $data[$key]["name"] = $product["name"];
    $data[$key]["price"] = $product["price"];
    $data[$key]["quantity"] = $product["quantity"];
    $data[$key]["slug"] = $product["slug"];
    $data[$key]["stock_available"] = $product["stock_available"];
    $data[$key]["stock_total"] = $product["stock_total"];
    $data[$key]["updated_at"] = $product["updated_at"];
    $data[$key]["users_id"] = $product["users_id"];
    $data[$key]["photo"] = Storage::url($product->galleries->first()->photos);
  }
  return response()->json([
    'data' => $data
  ], 200);
});

