import 'package:flutter/material.dart';

class CustomAppLocalizations {
  final Locale locale;
  const CustomAppLocalizations({required this.locale});

  static CustomAppLocalizations of(BuildContext context) {
    return Localizations.of<CustomAppLocalizations>(context, CustomAppLocalizations)!;
  }

  static final languages = _localizedValues.keys.toList();
  static final locales = _localizedValues.keys.map(Locale.new).toList();
  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'home': 'Home(*)',
      'page': 'Page(*)',
      'helloWorld': 'Hello World(*)',
      'english': 'English(*)',
      'norwegian': 'Norwegian(*)',
      'localization': 'Localization(*)'
    },
    'no': {
      'home': 'Hjem(*)',
      'page': 'Side(*)',
      'helloWorld': 'Hei Verden(*)',
      'english': 'Engelsk(*)',
      'norwegian': 'Norsk(*)',
      'localization': 'Lokalisering(*)'
    }
  };

  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get page => _localizedValues[locale.languageCode]!['page']!;
  String get helloWorld => _localizedValues[locale.languageCode]!['helloWorld']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get norwegian => _localizedValues[locale.languageCode]!['norwegian']!;
  String get localization => _localizedValues[locale.languageCode]!['localization']!;
}