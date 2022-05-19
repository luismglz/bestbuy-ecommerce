<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/product', 'App\Http\Controllers\ProductController@index'); //get all products
Route::post('/product/new', 'App\Http\Controllers\ProductController@store'); //add product
Route::put('/product/edit/{id}', 'App\Http\Controllers\ProductController@update'); //update product
Route::put('/product/{id}', 'App\Http\Controllers\ProductController@destroy'); //delete product
