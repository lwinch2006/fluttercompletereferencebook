import 'package:chapter14/components/chapter14_desktop_always_visible_scrollbar_behaviour.dart';
import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';

void main() {
  final router = generateRouter();

  runApp(MaterialApp.router(
    title: 'Flutter Demo',
    scrollBehavior: const Chapter14DesktopAlwaysVisibleScrollbarBehaviour(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    routerConfig: router,
  ));
}
