export 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:chapter15/l10n/l10n_extensions.dart';
import 'package:flutter/material.dart';

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

