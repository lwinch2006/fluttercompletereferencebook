import 'package:chapter12/models/my_app_state.dart';
import 'package:flutter/material.dart';

class MyAppStateWidget extends InheritedWidget {
  final MyAppState state;
  final ValueNotifier<int> counterState;

  const MyAppStateWidget({
    super.key,
    required this.state,
    required this.counterState,
    required super.child,
  });

  static MyAppStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyAppStateWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant MyAppStateWidget oldWidget) {
    return state != oldWidget.state || counterState != oldWidget.counterState;
  }
}
