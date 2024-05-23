import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  final String title;

  const Page4({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page4State();
}

class _Page4State extends State<Page4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Nothing here'),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 4, context: context),
    );
  }
}
