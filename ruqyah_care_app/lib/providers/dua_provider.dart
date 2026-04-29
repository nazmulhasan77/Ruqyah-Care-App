// lib/providers/dua_provider.dart
import 'package:flutter/material.dart';
import '../data/models/dua_model.dart';
import '../data/repositories/ruqyah_repository.dart';

class DuaProvider extends ChangeNotifier {
  final RuqyahRepository _repository = RuqyahRepository();

  List<DuaModel> _duas = [];
  bool _isLoading = false;
  String? _error;

  List<DuaModel> get duas => _duas;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDuas() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _duas = await _repository.getDuas();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
