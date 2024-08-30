import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String?> getCity() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        log('Location services are disabled.');
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        log('Location permissions are permanently denied.');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        log('Requesting location permissions...');
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          log('Location permissions are denied (whileInUse or always).');
          return Future.error(
              'Location permissions are denied (whileInUse or always).');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      log('Position: ${position.latitude}, ${position.longitude}');

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          String? city = placemarks[0].locality;
          log('City found: $city');
          return city;
        } else {
          log('No placemark found at the position.');
          return null;
        }
      } catch (e) {
        log('Error in geocoding: $e');
        return Future.error('Geocoding failed: $e');
      }
    } catch (e) {
      log('Error in getting city: $e');
      return Future.error('Error in getting city: $e');
    }
  }
}
