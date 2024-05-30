import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  final String title;

  const Page5({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page5State();
}

class _Page5State extends State<Page5> {

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).devicePixelRatio.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, Dmitry',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Matrix'
              ),
            ),
            Image(
              image: AssetImage('assets/images/044.png'),
              width: 100,
              height: 100,
            ),
          ],
        )
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 5, context: context),
    );
  }
}
