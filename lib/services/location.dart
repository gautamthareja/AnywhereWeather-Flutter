import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      print('exception not caught in getting location');
      Position geoPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = geoPosition.latitude;
      longitude = geoPosition.longitude;
    } catch (e) {
      print('exception caught in getting location: $e \n');
      Position geoPosition = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = geoPosition.latitude;
      longitude = geoPosition.longitude;
    }
  }
}
