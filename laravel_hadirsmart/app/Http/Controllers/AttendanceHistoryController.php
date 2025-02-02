<?php

namespace App\Http\Controllers;

use App\Helpers\URLDownloader;
use App\Models\AttendanceHistory;
use App\Models\User;
use App\Services\FaceRecognitionService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Sanctum\PersonalAccessToken;

class AttendanceHistoryController extends Controller
{
    public function index(Request $request)
    {
        $token = request()->bearerToken();
        $accessToken = PersonalAccessToken::findToken($token);
        $current_user = $accessToken->tokenable;
        $isHRD = $current_user->role == "HRD";
        $isEmployee = $current_user->role == "Employee";

        // Mengambil data riwayat kehadiran berdasarkan user yang sedang login
        $attendanceHistories = AttendanceHistory::where('user_id', $current_user->id)->latest()->paginate($request->input('per_page', 10));

        // Mengembalikan data dalam bentuk response JSON
        return response()->json($attendanceHistories);
    }


    public function checkIn(Request $request)
    {
        $token = request()->bearerToken();
        $accessToken = PersonalAccessToken::findToken($token);
        $current_user = $accessToken->tokenable;
        $isHRD = $current_user->role == "HRD";
        $isEmployee = $current_user->role == "Employee";

        // Memeriksa apakah pengguna telah melakukan check-in hari ini
        $existingCheckIn = AttendanceHistory::where('user_id', $current_user->id)
            ->whereDate('check_in_date', now()->toDateString())
            ->first();


        // Jika pengguna sudah melakukan check-in hari ini, kembalikan pesan error
        if ($existingCheckIn) {
            return response()->json(['error' => 'You have already checked in today'], 400);
        }

        //Check apakah wajah dikenali atau tidak
        $user =  User::find($current_user->id);
        if ($user->photo == null) {
            return response()->json(['message' => 'Please train a photo'], 400);
        }

        // download photo yang sudah dimasukkan
        $current_user_photo = URLDownloader::download($user->photo);
        $current_user_uploaded_photo = URLDownloader::download($request->input('photo'));

        $isRecognized =  FaceRecognitionService::recognize($current_user_photo, $current_user_uploaded_photo);
        if (!$isRecognized) {
            return response()->json([
                'statusCode' => 400,
                'error' => 'Unrecognized',
            ], 400);
    }

        // Jika belum, buat data baru untuk check-in
        $checkInData = [
            'user_id' => $current_user->id,
            'check_in_latitude' => $request->input('latitude'),
            'check_in_longitude' => $request->input('longitude'),
            'check_in_photo' => $request->input('photo'),
            'check_in_date' => now(),
            'status' => 'checked_in'
        ];

        // Menyimpan data kehadiran check-in dalam database
        AttendanceHistory::create($checkInData);

        // Mengembalikan respons berhasil
        return response()->json(['message' => 'Check-in success']);
    }


    public function checkOut(Request $request)
    {
        $token = request()->bearerToken();
        $accessToken = PersonalAccessToken::findToken($token);
        $current_user = $accessToken->tokenable;
        $isHRD = $current_user->role == "HRD";
        $isEmployee = $current_user->role == "Employee";

        // Memeriksa apakah pengguna telah melakukan check-out hari ini
        $existingCheckOut = AttendanceHistory::where('user_id', $current_user->id)
            ->whereDate('check_in_date', now()->toDateString())
            ->whereNotNull('check_out_date')
            ->first();

        // Jika pengguna sudah melakukan check-out hari ini, kembalikan pesan error
        if ($existingCheckOut) {
            return response()->json(['error' => 'You have already checked out today'], 400);
        }

        // Mendapatkan data kehadiran terakhir untuk user yang sedang login hari ini
        $lastAttendance = AttendanceHistory::where('user_id', $current_user->id)
            ->whereDate('check_in_date', now()->toDateString())
            ->latest()
            ->first();

        // Memastikan user telah melakukan check-in sebelum melakukan check-out
        if ($lastAttendance && $lastAttendance->status === 'checked_in') {
            // Melakukan check-out

            //Check apakah wajah dikenali atau tidak
            $user =  User::find($current_user->id);
            $current_user_photo = URLDownloader::download($user->photo);
            $current_user_uploaded_photo = URLDownloader::download($request->input('photo'));
            $isRecognized =  FaceRecognitionService::recognize($current_user_photo, $current_user_uploaded_photo);
            if (!$isRecognized) {
                    return response()->json([
                        'statusCode' => 400,
                        'error' => 'Unrecognized',
                    ], 400);
            }

            $lastAttendance->update([
                'check_out_latitude' => $request->input('latitude'),
                'check_out_longitude' => $request->input('longitude'),
                'check_out_photo' => $request->input('photo'),
                'check_out_date' => now(),
                'status' => 'checked_out'
            ]);

            // Mengembalikan respons berhasil
            return response()->json(['message' => 'Check-out success']);
        }

        // Mengembalikan respons error jika user belum melakukan check-in sebelumnya
        return response()->json(['error' => 'Please check-in before checking out'], 400);
    }


    public function checkInAndCheckoutStatusToday(Request $request)
    {
        $token = request()->bearerToken();
        $accessToken = PersonalAccessToken::findToken($token);
        $current_user = $accessToken->tokenable;
        $isHRD = $current_user->role == "HRD";
        $isEmployee = $current_user->role == "Employee";

        // Mendapatkan status check-in dan check-out untuk user yang sedang login hari ini
        $todayAttendance = AttendanceHistory::where('user_id', $current_user->id)
            ->whereDate('check_in_date', now()->toDateString())->latest()->first();

        // Mengembalikan respons dalam bentuk JSON
        return response()->json([
            "data" => $todayAttendance
        ]);
    }

    public function resetAttendanceToday(Request $request)
    {
        try {
            // Mendapatkan token dari permintaan
            $token = $request->bearerToken();
            
            // Validasi token
            if (!$token) {
                return response()->json(['message' => 'Token not provided'], 401);
            }
    
            $accessToken = PersonalAccessToken::findToken($token);
    
            // Validasi token
            if (!$accessToken) {
                return response()->json(['message' => 'Invalid token'], 401);
            }
    
            $currentUser = $accessToken->tokenable;
    
            // Validasi peran pengguna
            if ($currentUser->role !== 'HRD' && $currentUser->role !== 'Employee') {
                return response()->json(['message' => 'Unauthorized access'], 403);
            }
    
            // Menghapus data kehadiran pengguna yang sedang login untuk hari ini
            AttendanceHistory::where('user_id', $currentUser->id)
                ->whereDate('check_in_date', now()->toDateString())
                ->delete();
    
            // Mengembalikan respons berhasil
            return response()->json(['message' => 'Attendance reset successfully'], 200);
        } catch (\Exception $e) {
            // Menangani error
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }
    
}
