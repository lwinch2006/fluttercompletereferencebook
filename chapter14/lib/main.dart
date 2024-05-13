import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';

void main() {
  final router = generateRouter();

  runApp(MaterialApp.router(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    routerConfig: router,
  ));
}
