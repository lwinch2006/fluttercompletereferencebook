import 'package:chapter12/models/my_app_state.dart';
import 'package:chapter12/my_app_state_widget.dart';
import 'package:chapter12/pages/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'root',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyAppStateWidget(
        state: MyAppState(
          counter: 0,
        ),
        counterState: ValueNotifier(0),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
