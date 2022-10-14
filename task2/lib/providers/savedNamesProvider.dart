import 'package:flutter/material.dart';

class SavedNames with ChangeNotifier {
  final List<String> _saved = ["testSaved", "testSavedTwo"];

  List<String> get saved => _saved;

  int get length => _saved.length;

  bool checkAlreadySaved(String word) {
    return _saved.contains(word);
  }

  void addSavedName(String word) {
    _saved.add(word);
    notifyListeners();
  }

  void removeSavedName(String word) {
    _saved.remove(word);
    notifyListeners();
  }
}
