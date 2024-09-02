import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trip_script/models/location.dart';

class LocationProvider with ChangeNotifier {
  Future<List<Location>> fetchLocations() async {
    try {
      final locationSnap =
          await FirebaseFirestore.instance.collection('locations').get();
      final locationDocs = locationSnap.docs;
      List<Location> locations = [];
      for (final doc in locationDocs) {
        Location location = Location(
          id: doc['id'] as String,
          name: doc['name'] as String,
          city: doc['city'] as String,
          region: doc['region'] as String,
          images: doc['images'] as List<String>,
          rating: doc['rating'] as double,
          category: doc['category'] as String,
          operatingDays: doc['operatingDays'] as List<String>,
          openingTime: (doc['openingTime'] as Timestamp).toDate(),
          closingTime: (doc['closingTime'] as Timestamp).toDate(),
          description: doc['description'] as String,
          websiteLink: doc['websiteLink'] as String,
          latitude: doc['latitude'] as String,
          longitude: doc['longitude'] as String,
        );
        locations.add(location);
        notifyListeners();
      }
      return locations;
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<List<Location>> fetchRecommendedLocations() async {
    try {
      final locationSnap = await FirebaseFirestore.instance
          .collection('locations')
          .orderBy('rating', descending: true)
          .limit(8)
          .get();
      final locationDocs = locationSnap.docs;
      final List<Location> recommendedLocations = [];
      for (final doc in locationDocs) {
        Location location = Location(
          id: doc['id'] as String,
          name: doc['name'] as String,
          city: doc['city'] as String,
          region: doc['region'] as String,
          images: doc['images'] as List<dynamic>,
          rating: doc['rating'] as double,
          category: doc['category'] as String,
          operatingDays: doc['operatingDays'] as List<dynamic>,
          openingTime: (doc['openingTime'] as Timestamp).toDate(),
          closingTime: (doc['closingTime'] as Timestamp).toDate(),
          description: doc['description'] as String,
          websiteLink: doc['websiteLink'] as String,
          latitude: doc['latitude'] as String,
          longitude: doc['longitude'] as String,
        );
        recommendedLocations.add(location);
        notifyListeners();
      }
      return recommendedLocations;
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<List<Location>> fetchNearbyLocations() async {
    try {
      Position userPosition = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final locationSnap = await FirebaseFirestore.instance
          .collection('locations')
          .limit(10)
          .get();
      final locationDocs = locationSnap.docs;
      final List<Location> allLocations = [];
      final Map<Location, double> locationDistances = {};

      for (final doc in locationDocs) {
        Location location = Location(
          id: doc['id'] as String,
          name: doc['name'] as String,
          city: doc['city'] as String,
          region: doc['region'] as String,
          images: doc['images'] as List<dynamic>,
          rating: doc['rating'] as double,
          category: doc['category'] as String,
          operatingDays: doc['operatingDays'] as List<dynamic>,
          openingTime: (doc['openingTime'] as Timestamp).toDate(),
          closingTime: (doc['closingTime'] as Timestamp).toDate(),
          description: doc['description'] as String,
          websiteLink: doc['websiteLink'] as String,
          latitude: doc['latitude'] as String,
          longitude: doc['longitude'] as String,
        );

        double distanceInMeters = Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          double.parse(location.latitude),
          double.parse(location.longitude),
        );

        locationDistances[location] = distanceInMeters;
        allLocations.add(location);
      }

      allLocations.sort(
          (a, b) => locationDistances[a]!.compareTo(locationDistances[b]!));

      return allLocations.take(8).toList();
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<List<Location>> fetchNearbyPopularLocations() async {
    try {
      Position userPosition = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final locationSnap = await FirebaseFirestore.instance
          .collection('locations')
          .orderBy('rating', descending: true)
          .limit(8)
          .get();
      final locationDocs = locationSnap.docs;
      final List<Location> allLocations = [];
      final Map<Location, double> locationDistances = {};

      for (final doc in locationDocs) {
        Location location = Location(
          id: doc['id'] as String,
          name: doc['name'] as String,
          city: doc['city'] as String,
          region: doc['region'] as String,
          images: doc['images'] as List<dynamic>,
          rating: doc['rating'] as double,
          category: doc['category'] as String,
          operatingDays: doc['operatingDays'] as List<dynamic>,
          openingTime: (doc['openingTime'] as Timestamp).toDate(),
          closingTime: (doc['closingTime'] as Timestamp).toDate(),
          description: doc['description'] as String,
          websiteLink: doc['websiteLink'] as String,
          latitude: doc['latitude'] as String,
          longitude: doc['longitude'] as String,
        );

        double distanceInMeters = Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          double.parse(location.latitude),
          double.parse(location.longitude),
        );

        locationDistances[location] = distanceInMeters;
        allLocations.add(location);
      }

      allLocations.sort(
          (a, b) => locationDistances[a]!.compareTo(locationDistances[b]!));

      return allLocations.take(8).toList();
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<List<Location>> fetchLocationByRegion(String region) async {
    try {
      final locationSnap = await FirebaseFirestore.instance
          .collection('locations')
          .where('region', isEqualTo: region)
          .get();
      final locationDocs = locationSnap.docs;
      List<Location> locations = [];
      for (final doc in locationDocs) {
        Location location = Location(
          id: doc['id'] as String,
          name: doc['name'] as String,
          city: doc['city'] as String,
          region: doc['region'] as String,
          images: doc['images'] as List<dynamic>,
          rating: doc['rating'] as double,
          category: doc['category'] as String,
          operatingDays: doc['operatingDays'] as List<dynamic>,
          openingTime: (doc['openingTime'] as Timestamp).toDate(),
          closingTime: (doc['closingTime'] as Timestamp).toDate(),
          description: doc['description'] as String,
          websiteLink: doc['websiteLink'] as String,
          latitude: doc['latitude'] as String,
          longitude: doc['longitude'] as String,
        );
        locations.add(location);
        notifyListeners();
      }
      return locations;
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }
}
