import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip_script/models/article.dart';

class ArticleProvider with ChangeNotifier {
  Future<List<Article>> fetchArticles() async {
    try {
      final articleSnap =
          await FirebaseFirestore.instance.collection('articles').get();
      final articleDocs = articleSnap.docs;
      List<Article> articles = [];
      for (final doc in articleDocs) {
        Article article = Article(
          url: doc['url'] as String,
          image: doc['image'] as String,
          source: doc['source'] as String,
          date: (doc['date'] as Timestamp).toDate(),
          title: doc['title'] as String,
        );
        articles.add(article);
        notifyListeners();
      }
      return articles;
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }
}
