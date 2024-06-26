import 'dart:convert';

import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  final String title;

  const Page4({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late final loadGreetingFromConfigFuture = loadGreetingFromConfig();


  Future<String?> loadGreetingFromConfig() async {
    final configAsString = await DefaultAssetBundle.of(context).loadString('assets/cfg.json');
    final configAsMap = json.decode(configAsString) as Map<String, Object?>;
    return configAsMap['greeting'] as String?;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadGreetingFromConfigFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final greeting = snapshot.data ?? 'N/A';

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.hello(greeting, 'Dmitry')),
                      Text('Number of persons (N=0) - ${context.l10n.peopleCount(0)}'),
                      Text('Number of persons (N=1) - ${context.l10n.peopleCount(1)}'),
                      Text('Number of persons (N=3) - ${context.l10n.peopleCount(3)}'),
                      Text(context.l10n.birthday(DateTime.now())),
                      Text('Dmitry is ${context.l10n.genderPronounce('male')}'),
                      Text(context.l10n.balance(15.20)),
                      Text(context.l10n.balance(115000.20)),
                      Text(context.l10n.balanceWithSmall(15.1234)),
                      Text(context.l10n.balanceWithSmall(115000.1234)),
                    ],
                  )

              ),
              bottomNavigationBar: Chapter15BottomNavigationBar(
                  currentSelectedIndex: 4, context: context),
            );
          }

          if (snapshot.hasError) {
            return const Text('The asset could not be loaded');
          }

          return const Text('Loading...');
        },
    );
  }
}
