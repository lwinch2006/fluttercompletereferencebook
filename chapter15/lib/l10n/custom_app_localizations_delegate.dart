import 'package:chapter15/l10n/custom_app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomAppLocalizationsDelegate extends LocalizationsDelegate<CustomAppLocalizations> {
  const CustomAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return CustomAppLocalizations.languages.contains(locale.languageCode);
  }

  @override
  Future<CustomAppLocalizations> load(Locale locale) {
    return SynchronousFuture<CustomAppLocalizations>(CustomAppLocalizations(locale: locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomAppLocalizations> old) {
    return false;
  }

}