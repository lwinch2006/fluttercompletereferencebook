import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  int _counter;
  MyAppState({required int counter}): _counter = counter;

  int get counter => _counter;
  set counter(int newCounter) {
    if (_counter != newCounter) {
      _counter = newCounter;
      notifyListeners();
    }
  }
}
