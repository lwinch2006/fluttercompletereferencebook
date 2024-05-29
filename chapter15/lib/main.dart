import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/l10n/custom_app_localizations.dart';
import 'package:chapter15/l10n/custom_app_localizations_delegate.dart';
import 'package:chapter15/state/locale_state_widget.dart';
import 'package:chapter15/models/locales.dart';
import 'package:chapter15/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(LocaleStateWidget(
    localeState: ValueNotifier<Locale>(Locales.english),
    child: const _App(),
  ));
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.localeState,
      builder: (context, _) {
        final router = generateRouter();

        return MaterialApp.router(
          //showSemanticsDebugger: true, // Does not show semantics overlay. Don't know why.
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,

          // These methods when intl package is used
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          // These methods when CustomAppLocalizations class is used
          // localizationsDelegates: const [
          //   CustomAppLocalizationsDelegate(),
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate
          // ],
          // supportedLocales: CustomAppLocalizations.locales,

          locale: context.localeState.value,
        );
      },
    );
  }
}
