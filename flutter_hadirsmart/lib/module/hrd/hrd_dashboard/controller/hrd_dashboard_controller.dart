import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hyper_ui/service/attendance_service/attendance_service.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import 'package:hyper_ui/service/location_service/location_service.dart';
import 'package:hyper_ui/service/upload_service/upload_service.dart';
import 'package:hyper_ui/service/user_service/user_service.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:hyper_ui/shared/util/dialog/show_info_dialog.dart';
import 'package:hyper_ui/shared/util/log/log.dart';
import 'package:hyper_ui/shared/util/show_loading/show_loading.dart';
import 'package:image_picker/image_picker.dart';
import '../state/hrd_dashboard_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class HrdDashboardController extends Cubit<HrdDashboardState>
    implements IBlocBase {
  HrdDashboardController() : super(HrdDashboardState());

  @override
  void initState() {
    //initState event
    // getCurrentUserData();
    loadData();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  int getFileSizeInBytes(String filePath) {
    File file = File(filePath);
    int fileSizeInBytes = file.lengthSync();
    return fileSizeInBytes;
  }

  loadData() async {
    state.getUserByIdResponse = null;
    emit(state.copyWith());

    state.getUserByIdResponse = await UserService().getUserById(currentUserId!);
    emit(state.copyWith());

    state.getAttendanceStatusTodayResponse =
        await AttendanceService().getAttendanceStatusToday();
    emit(state.copyWith());
  }

  bool get isCheckedInToday =>
      state.getAttendanceStatusTodayResponse?.data?.checkInDate != null;

  bool get isCheckedOutToday =>
      state.getAttendanceStatusTodayResponse?.data?.checkOutDate != null;

  DateTime? get checkInDate =>
      state.getAttendanceStatusTodayResponse?.data?.checkInDate;

  DateTime? get checkoutDate =>
      state.getAttendanceStatusTodayResponse?.data?.checkOutDate;

  Future<String?> takePhoto({required ImageSource source}) async {
    XFile? image = await ImagePicker().pickImage(
      source: source,
      maxWidth: 1024,
    );
    String? filePath = image?.path;
    if (filePath == null) return null;

    int fileSize = getFileSizeInBytes(filePath);
    printg("fileSize: $fileSize Bytes");

    ss("Upload photo...");
    var url = await UploadService().uploadToCloudinary(filePath);
    ss("Upload photo success $url");
    return url;
  }

  checkIn({required ImageSource source}) async {
    try {
      bool isLocationActive = await checkLocationActiveOrNot();
      if (!isLocationActive) {
        return;
      }

      showLoading();
      print("Check In?");

      String? photoUrl = await takePhoto(source: source);
      if (photoUrl == null) {
        hideLoading();
        return;
      }

      ss("Get location...");
      var position = await LocationService().getLocation();
      print("Get location ${position?.latitude},${position?.longitude}...");

      await AttendanceService().checkIn(
        photo: photoUrl,
        latitude: position!.latitude,
        longitude: position.longitude,
      );

      await loadData();
      hideLoading();
      ss("Check in success");
    } on Exception catch (err) {
      printr(err.toString());
      hideLoading();
      se("Check in failed $err");
    }
  }

  checkOut({required ImageSource source}) async {
    try {
      bool isLocationActive = await checkLocationActiveOrNot();
      if (!isLocationActive) {
        return;
      }

      showLoading();
      print("Check Out?");

      String? photoUrl = await takePhoto(source: source);
      if (photoUrl == null) {
        hideLoading();
        return;
      }

      print("Get location...");
      var position = await LocationService().getLocation();
      ss("Get location ${position?.latitude},${position?.longitude}...");

      await AttendanceService().checkOut(
        photo: photoUrl,
        latitude: position!.latitude,
        longitude: position.longitude,
      );

      await loadData();
      hideLoading();
      ss("Check out success");
    } on Exception catch (err) {
      hideLoading();
      se("Check out failed, unrecognized or already check out today");
      printr(err);
    }
  }

  checkLocationActiveOrNot() async {
    try {
      // Mengecek apakah layanan lokasi aktif
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showInfoDialog(
          title: "Layanan Lokasi Tidak Aktif",
          titleColor: warningColor,
          buttonText: "Oke",
          buttonColor: warningColor,
          message: "Harap aktifkan layanan lokasi untuk melanjutkan.",
        );
        return false;
      }

      // Mengecek izin lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showInfoDialog(
            title: "Izin Lokasi Ditolak",
            titleColor: warningColor,
            buttonText: "Oke",
            buttonColor: warningColor,
            message: "Harap izinkan akses lokasi untuk melanjutkan.",
          );
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showInfoDialog(
          title: "Izin Lokasi Diblokir",
          titleColor: warningColor,
          buttonText: "Oke",
          buttonColor: warningColor,
          message:
              "Izin lokasi diblokir secara permanen. Harap ubah pengaturan aplikasi.",
        );
        return false;
      }

      return true;
    } catch (e) {
      printr("Error checking location: $e");
      return false;
    }
  }

  reset() async {
    showLoading();
    await AttendanceService().reset();
    await loadData();
    hideLoading();
  }
}
