import 'package:flutter/material.dart';

void showCustomSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    ),
  );
}
