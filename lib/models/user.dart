import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String uid;
  final String name;
  final String imagePath;
  final String email;
  final String phoneNumber;
  final String emergencyNumber;

  User({
    required this.uid,
    required this.name,
    required this.imagePath,
    required this.email,
    required this.phoneNumber,
    required this.emergencyNumber,
  });
}
