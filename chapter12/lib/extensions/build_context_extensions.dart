import 'package:chapter12/models/my_app_state.dart';
import 'package:chapter12/my_app_state_widget.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  MyAppState get state => MyAppStateWidget.of(this).state;
  ValueNotifier<int> get counterState => MyAppStateWidget.of(this).counterState;
}


