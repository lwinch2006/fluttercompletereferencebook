import 'package:chapter15/state/locale_state_widget.dart';
import 'package:flutter/material.dart';

extension BuildContextExtentions on BuildContext {
  ValueNotifier<Locale> get localeState => LocaleStateWidget.of(this).localeState;
}