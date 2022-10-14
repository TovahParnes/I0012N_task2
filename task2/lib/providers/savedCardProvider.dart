import 'package:flutter/material.dart';

class SavedCards with ChangeNotifier {
  final List<List<String>> _saved = [];
  //[[image, text], [image, text]]

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
