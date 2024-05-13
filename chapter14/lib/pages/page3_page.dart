import 'dart:io';

import 'package:chapter14/breakpoints.dart';
import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatefulWidget {
  final String title;

  const Page3({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final _items = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > doubleColumnBreakpoint) {
            var increment = 0;
            return SizedBox(
              width: 400,
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    if (index + increment >= _items.length) {
                      return null;
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          SizedBox(
                            width: 200,
                            child: ListTile(
                              leading: const Icon(Icons.add_box_outlined),
                              title: Text(_items[index + increment]),
                              onTap: () {},
                            ),
                          ),
                        if (index + increment < _items.length-1)
                          SizedBox(
                            width: 200,
                            child: ListTile(
                              leading: const Icon(Icons.add_box_outlined),
                              title: Text(_items[index + ++increment]),
                              onTap: () {},
                            ),
                          )
                      ],
                    );
                  }),
            );
          }

          return SizedBox(
            width: 200,
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: Text(_items[index]),
                onTap: () {},
              ),
            ),
          );
        },
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 3, context: context),
    );
  }
}
