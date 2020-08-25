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
    return view('auths/login');
});


Route::get('/login', 'AuthController@login')->name('login');
Route::post('/postlogin', 'AuthController@postlogin')->name('postlogin');
Route::get('/logout', 'AuthController@logout')->name('logout');

Route::group(['middleware' => 'auth'], function(){

    Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
    Route::get('/jadwal', 'JadwalController@index')->name('jadwal');
    Route::post('jadwal/create', 'JadwalController@create')->name('create');
    Route::get('/jadwal/{id}/edit', 'JadwalController@edit')->name('edit');
    Route::post('/jadwal/{id}/update', 'JadwalController@update')->name('update');
    Route::get('/jadwal/{id}/delete', 'JadwalController@delete')->name('delete');
});