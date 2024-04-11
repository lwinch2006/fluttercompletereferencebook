import 'package:chapter13/models/app_state.dart';
import 'package:flutter/material.dart';

final class AppStateWidget extends InheritedWidget {
  final AppState appState;
  const AppStateWidget({super.key, required this.appState, required super.child});

  static AppStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant AppStateWidget oldWidget) {
    return appState != oldWidget.appState;
  }
}