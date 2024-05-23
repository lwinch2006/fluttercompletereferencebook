import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page8 extends StatefulWidget {
  final String title;

  const Page8({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  final _container = Container(
    color: Colors.grey,
    width: 50,
    height: 50,
    margin: const EdgeInsets.all(5),
  );

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
          currentSelectedIndex: 8, context: context),
    );
  }
}
