import 'package:flutter/material.dart';

class SavedCards with ChangeNotifier {
  final List<List<String>> _saved = [
    ["assets/wallpaper-1.jpeg", "test"],
    ["assets/wallpaper-2.jpeg", "HomeWorld"]
  ];

  List<List<String>> get saved => _saved;

  int get length => _saved.length;

  bool checkAlreadySaved(List<String> card) {
    return _saved.contains(card);
  }

  void addSavedCard(List<String> card) {
    _saved.add(card);
    notifyListeners();
  }

  void removeSavedCard(List<String> card) {
    _saved.remove(card);
    notifyListeners();
  }
}
