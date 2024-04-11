import 'package:chapter13/app_state_widget.dart';
import 'package:chapter13/models/app_state.dart';
import 'package:chapter13/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      appState: AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: homePageRouteName,
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}
