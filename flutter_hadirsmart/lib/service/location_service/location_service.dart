import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  Future<LatLng?> getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (kDebugMode) {
        var lastKnownPosition = await Geolocator.getLastKnownPosition();

        if (lastKnownPosition != null) {
          return LatLng(
            lastKnownPosition.latitude,
            lastKnownPosition.longitude,
          );
        }
      }

      if (kDebugMode) {
        var lastKnownPosition = await Geolocator.getLastKnownPosition();
        if (lastKnownPosition != null) {
          return LatLng(
            lastKnownPosition.latitude,
            lastKnownPosition.longitude,
          );
        }
      }
      // final LocationSettings locationSettings = kDebugMode
      //     ? LocationSettings(
      //         accuracy: LocationAccuracy.lowest,
      //         distanceFilter: 0,
      //       )
      //     : LocationSettings(
      //         accuracy: LocationAccuracy.high,
      //         distanceFilter: 50,
      //       );
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 50,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      // Position position = await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.best,
      // );
      return LatLng(position.latitude, position.longitude);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
