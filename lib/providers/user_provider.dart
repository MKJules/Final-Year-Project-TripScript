import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip_script/models/user.dart';

class UserProvider with ChangeNotifier {
  Future<void> createUser(User newUser) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUser.uid)
          .set({
        'uid': newUser.uid,
        'name': newUser.name,
        'imagePath': newUser.imagePath,
        'email': newUser.email,
        'phoneNumber': newUser.phoneNumber,
        'emergencyNumber': newUser.emergencyNumber,
      });
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<User> getUserDetails(String email) async {
    try {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      final userDoc = userSnapshot.docs.first;

      User user = User(
        uid: userDoc['uid'] as String,
        name: userDoc['name'] as String,
        imagePath: userDoc['imagePath'] as String,
        email: userDoc['email'] as String,
        phoneNumber: userDoc['phoneNumber'] as String,
        emergencyNumber: userDoc['emergencyNumber'] as String,
      );
      notifyListeners();

      return user;
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  Future<void> editDetails(User user) async{
    try{
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'name': user.name,
        'imagePath': user.imagePath,
        'phoneNumber': user.phoneNumber,
        'emergencyNumber': user.emergencyNumber,
      });
      notifyListeners();
    }
    catch(error){
      log('Error: $error');
      rethrow;
    }
  }
}
