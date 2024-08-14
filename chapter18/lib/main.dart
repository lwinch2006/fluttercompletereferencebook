import 'package:chapter18/routes.dart';
import 'package:flutter/material.dart';

void main() {
  final router = generateRouter();

  runApp(MaterialApp.router(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      //visualDensity: VisualDensity(horizontal: -4, vertical: -4)
    ),
    routerConfig: router,
  ));
}


