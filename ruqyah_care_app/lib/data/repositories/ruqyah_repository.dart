// lib/data/repositories/ruqyah_repository.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/ruqyah_verse_model.dart';
import '../models/dua_model.dart';

class RuqyahRepository {
  Future<List<RuqyahVerse>> getVerses() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/data backup - ayat+article.json',
      );
      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList.map((item) => RuqyahVerse.fromJson(item)).toList();
    } catch (e) {
      print('Error loading verses: $e');
      return [];
    }
  }

  Future<List<DuaModel>> getDuas() async {
    try {
      // TODO: Implement when data source is available
      return [];
    } catch (e) {
      print('Error loading duas: $e');
      return [];
    }
  }
}
