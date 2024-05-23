import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/extensions/value_notifier_extensions.dart';
import 'package:chapter15/l10n/l10n.dart';
import 'package:chapter15/models/locales.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final container = Container(
    color: Colors.grey,
    width: 50,
    height: 50,
    margin: const EdgeInsets.all(5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.l10n.helloWorld),
            ElevatedButton(
                onPressed: () {
                  if (context.localeState.value == Locales.english) {
                    context.localeState.value = Locales.norwegian;
                  } else {
                    context.localeState.value = Locales.english;
                  }
                },
                child: Text(context.localeState.getLocaleFullName(context)))
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 0, context: context),
    );
  }
}
