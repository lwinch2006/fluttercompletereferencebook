import 'package:chapter15/components/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  final String title;

  const Page7({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page7State();
}

class _Page7State extends State<Page7> {

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
          currentSelectedIndex: 7, context: context),
    );
  }
}
