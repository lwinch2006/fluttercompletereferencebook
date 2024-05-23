import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page9 extends StatefulWidget {
  final String title;

  const Page9({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page9State();
}

class _Page9State extends State<Page9> {

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
          currentSelectedIndex: 9, context: context),
    );
  }
}
