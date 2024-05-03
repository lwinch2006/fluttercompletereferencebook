import 'package:chapter13_4/routes.dart';
import 'package:flutter/material.dart';

void main() {
  final router = generateRouter();

  runApp(
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ));
}