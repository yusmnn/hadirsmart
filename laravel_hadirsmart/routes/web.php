<?php

use App\Http\Controllers\AttendanceHistoryController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserRequestHistoryController;
use App\Models\UserRequestHistory;
use Illuminate\Support\Facades\Route;

/*
Important:
https://securinglaravel.com/p/security-tip-laravel-11s-middleware

*/

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('api')->group(function () {

    Route::prefix('auth')->group(function () {
        Route::post('/login', [AuthController::class, 'login']);
        Route::post('/logout', [AuthController::class, 'logout']);
    });

    Route::prefix('users')->group(function () {
        Route::get('/', [UserController::class, 'index']);            
        Route::post('/', [UserController::class, 'store']);            
        Route::get('/{id}', [UserController::class, 'show']);          
        Route::put('/{id}', [UserController::class, 'update']);        
        Route::delete('/{id}', [UserController::class, 'destroy']);
    });

    Route::prefix('companies')->group(function () {
        Route::get('/', [CompanyController::class, 'index']);            
        Route::post('/', [CompanyController::class, 'store']);            
        Route::get('/{id}', [CompanyController::class, 'show']);          
        Route::put('/{id}', [CompanyController::class, 'update']);        
        Route::delete('/{id}', [CompanyController::class, 'destroy']);
    });

    Route::prefix('user-request-histories')->group(function () {
        Route::get('/', [UserRequestHistoryController::class, 'index']);            
        Route::post('/', [UserRequestHistoryController::class, 'store']);            
        Route::get('/{id}', [UserRequestHistoryController::class, 'show']);          
        Route::put('/{id}', [UserRequestHistoryController::class, 'update']);       
        Route::delete('/{id}', [UserRequestHistoryController::class, 'destroy']);
    });

    Route::prefix('attendance-histories')->group(function() {
        Route::get('/', [AttendanceHistoryController::class, 'index']);
        Route::post('/check-in', [AttendanceHistoryController::class, 'checkIn']);
        Route::post('/check-out', [AttendanceHistoryController::class, 'checkOut']);
        Route::post('/check-in-and-out-status-today', [AttendanceHistoryController::class, 'checkInAndCheckoutStatusToday']);
        Route::post('/reset-attendance-today', [AttendanceHistoryController::class, 'resetAttendanceToday']);

    });
});
