import 'package:flutter/material.dart';

class Article with ChangeNotifier {
  final String url;
  final String image;
  final String source;
  final DateTime date;
  final String title;

  Article({
    required this.url,
    required this.image,
    required this.source,
    required this.date,
    required this.title,
  });
}
