
import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

extension ValueNotifierLocaleExtensions on Locale {
  String getLocaleFullName(BuildContext context) {
    switch (languageCode) {
      case 'en':
        return context.l10n.english;
        // return context.customL10n.english;
      case 'no':
        return context.l10n.norwegian;
        // return context.customL10n.norwegian;
      default:
        return context.l10n.english;
        // return context.customL10n.english;
    }
  }
}