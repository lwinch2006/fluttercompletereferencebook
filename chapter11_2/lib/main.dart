import 'package:chapter11_2/layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final RoundedRectangleBorder _borderShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)));

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
            shape: _borderShape),
        dialogTheme: DialogTheme(
            shape: _borderShape),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll<OutlinedBorder>(
                _borderShape)
            ),
          ),
        ),
      debugShowCheckedModeBanner: false,
      home: const Layout(title: 'Flutter Demo Home Page'),
    );
  }
}
