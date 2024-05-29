export 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/l10n/custom_app_localizations.dart';
import 'package:chapter15/state/locale_state_widget.dart';
import 'package:flutter/material.dart';

extension BuildContextExtentions on BuildContext {
  ValueNotifier<Locale> get localeState => LocaleStateWidget.of(this).localeState;
  AppLocalizations get l10n => AppLocalizations.of(this);
  CustomAppLocalizations get customL10n => CustomAppLocalizations.of(this);
}