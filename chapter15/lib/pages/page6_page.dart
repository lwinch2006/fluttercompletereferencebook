import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  final String title;

  const Page6({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page6State();
}

class _Page6State extends State<Page6> {

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
          currentSelectedIndex: 6, context: context),
    );
  }
}
