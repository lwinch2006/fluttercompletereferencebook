import 'dart:io';

import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatefulWidget {
  final String title;

  const Page1({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Oversizing'),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: [
                      _container,
                      _container,
                      _container,
                    ],
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Expanded widget${Platform.lineTerminator}(takes all space, expands always)'),
              SizedBox(
                width: 200,
                child: Row(
                  // Fills all available space
                  children: [
                    Expanded(child: _container),
                    Expanded(child: _container),
                    Expanded(child: _container),
                  ],
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Flexible widget${Platform.lineTerminator}(shrinks if needed, does not expand)'),
              SizedBox(
                width: 160,
                child: Row(
                  // Fills all available space
                  children: [
                    Flexible(child: _container),
                    Flexible(child: _container),
                    Flexible(child: _container),
                  ],
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wrap widget${Platform.lineTerminator}(moves children to next line if necessary)'),
                SizedBox(
                  width: 160,
                  child: Wrap(
                    children: [
                      _container,
                      _container,
                      _container,
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Constrained box${Platform.lineTerminator}(constrains child size)'),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: 25, maxWidth: 100, minHeight: 25, maxHeight: 50),
                  child: Container(
                    width: 700,
                    height: 700,
                    color: Colors.black12,
                    child: const Text('Hello World'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 1, context: context),
    );
  }
}
