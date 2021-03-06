<?php

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

Route::get('/', function () {
    return redirect(route('login'));
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => 'auth'], function () {
    Route::get('/get/etf/{id}', 'ETF\ParseController@parseCurrentEtf')->name('get.etf.info');
    Route::get('/check/etf/{text}', 'ETF\ParseController@CheckEtf')->name('check.etf.info');
});