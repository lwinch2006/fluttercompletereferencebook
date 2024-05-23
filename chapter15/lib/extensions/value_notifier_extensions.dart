
import 'package:chapter15/l10n/l10n.dart';
import 'package:flutter/material.dart';

extension ValueNotifierLocaleExtensions on ValueNotifier<Locale> {
  String getLocaleFullName(BuildContext context) {
    switch (value.languageCode) {
      case 'en':
        return context.l10n.english;
      case 'no':
        return context.l10n.norwegian;
      default:
        return context.l10n.english;
    }
  }
}