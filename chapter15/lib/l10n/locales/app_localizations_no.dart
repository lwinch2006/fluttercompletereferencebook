// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get home => 'Hjem';

  @override
  String get page => 'Side';

  @override
  String get helloWorld => 'Hei Verden';

  @override
  String get english => 'Engelsk';

  @override
  String get norwegian => 'Norsk';

  @override
  String get localization => 'Lokalisering';

  @override
  String get numberFormatters => 'Tallformatere';

  @override
  String get dateAndTimeFormatters => 'Dato- og tidsformatere';

  @override
  String get accessibility => 'Tilgjengelighet';

  @override
  String get deepDive => 'Dypdykk';

  @override
  String get imagesAndFonts => 'Bilder og fonter';

  @override
  String get imagesInCustomPainter => 'Laster bilder i CustomPainter';

  @override
  String hello(String greeting, String userName) {
    return 'Hei, $greeting $userName';
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
      other: '$countString personer',
      one: 'en person',
      zero: 'ikke noen',
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

    return 'Jeg har bursdag den $dateString';
  }

  @override
  String genderPronounce(String gender) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Han',
      'female': 'Hun',
      'other': 'Den',
    });
    return '$_temp0';
  }

  @override
  String balance(double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.compactSimpleCurrency(locale: localeName);
    final String valueString = valueNumberFormat.format(value);

    return 'Konto beholdning: $valueString';
  }

  @override
  String balanceWithSmall(double value) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      decimalDigits: 2,
    );
    final String valueString = valueNumberFormat.format(value);

    return 'Konto beholdning: $valueString';
  }
}
