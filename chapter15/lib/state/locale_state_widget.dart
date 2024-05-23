import 'package:flutter/material.dart';

class LocaleStateWidget extends InheritedWidget {
  final ValueNotifier<Locale> localeState;

  const LocaleStateWidget({
    super.key,
    required super.child,
    required this.localeState,
  });

  @override
  bool updateShouldNotify(covariant LocaleStateWidget oldWidget) {
    return localeState != oldWidget.localeState;
  }

  static LocaleStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocaleStateWidget>()!;
  }
}