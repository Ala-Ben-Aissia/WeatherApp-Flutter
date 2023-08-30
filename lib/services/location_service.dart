// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class LocationService {
  double? latitude;
  double? longitude;
  LocationService({
    this.latitude,
    this.longitude,
  });
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      print(longitude);
      print(latitude);
    } catch (e) {
      log('ERROR: ${e.toString()}');
    }
  }
}
