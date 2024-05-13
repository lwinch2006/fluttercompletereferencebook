import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatefulWidget {
  final String title;

  const Page2({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Table widget'),
          Table(
            children: [
              for (var i = 0; i < 5; i++)
                TableRow(children: [
                  for (var j = 0; j < 10; j++)
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        color: Colors.black26,
                        child: Text('$i, $j'),
                      ),
                    )
                ])
            ],
          )
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 2, context: context),
    );
  }
}
