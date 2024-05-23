import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/state/locale_state_widget.dart';
import 'package:chapter15/l10n/l10n_extensions.dart';
import 'package:chapter15/models/locales.dart';
import 'package:chapter15/routes.dart';
import 'package:flutter/material.dart';

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
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.localeState.value,
        );
      },
    );
  }
}
