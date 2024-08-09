import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_plugin_platform_interface/date_plugin_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentDate = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String currentDate;

    try {
      currentDate =
          await DatePluginPlatform.instance.getDate() ?? 'Unknown date';
    } on PlatformException {
      currentDate = 'Failed to get date';
    }

    if (!mounted) return;

    setState(() {
      _currentDate = currentDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Current date: $_currentDate'),
        ),
      ),
    );
  }
}
