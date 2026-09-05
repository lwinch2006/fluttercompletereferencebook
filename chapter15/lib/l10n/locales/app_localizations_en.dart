// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get page => 'Page';

  @override
  String get helloWorld => 'Hello World';

  @override
  String get english => 'English';

  @override
  String get norwegian => 'Norwegian';

  @override
  String get localization => 'Localization';

  @override
  String get numberFormatters => 'Number formatters';

  @override
  String get dateAndTimeFormatters => 'Date and time formatters';

  @override
  String get accessibility => 'Accessibility';

  @override
  String get deepDive => 'Deep dive';

  @override
  String get imagesAndFonts => 'Images and fonts';

  @override
  String get imagesInCustomPainter => 'Loading images in CustomPainter';

  @override
  String hello(String greeting, String userName) {
    return 'Hello, $greeting $userName';
  }

  @override
  String peopleCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString people',
      one: 'one person',
      zero: 'no one',
    );
    return '$_temp0';
  }

  @override
  String birthday(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'EEEE, dd MMMM yyyy',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return 'My birthday is on $dateString';
  }

  @override
  String genderPronounce(String gender) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'He',
      'female': 'She',
      'other': 'It',
    });
    return '$_temp0';
  }

  @override
  String balance(double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.compactSimpleCurrency(locale: localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'Account balance: $valueString';
  }

  @override
  String balanceWithSmall(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      decimalDigits: 2,
    );
    final String valueString = valueNumberFormat.format(value);

    return 'Account balance: $valueString';
  }
}
