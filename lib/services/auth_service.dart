import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:trip_script/models/user.dart' as u;

import '../providers/user_provider.dart';

class AuthService {
  static Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'User not found';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password';
      } else if (e.code == 'invalid-credential') {
        throw 'Incorrect credentials. Check your email and password';
      } else {
        throw e.code;
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> signUp(
    u.User user,
    String password,
    BuildContext context,
  ) async {
    try {
      final UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await userProvider.createUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'Password must contain at least one uppercase, lowercase, number, and symbol';
      } else if (e.code == 'invalid-password') {
        throw 'Password is invalid';
      } else if (e.code == 'email-already-in-use') {
        throw 'Email belongs to another user. Sign up with a new email.';
      } else if (e.code == 'invalid-credential') {
        throw 'Incorrect credentials. Check your email and password.';
      } else {
        throw e.code;
      }
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> forgotPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showCustomSnackbar(
        'Check your email to reset your password. The email might be in your spam folder.',
        context,
      );
    } catch (e) {
      rethrow;
    }
  }
}
