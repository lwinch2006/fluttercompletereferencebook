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
    final dsp = View.maybeOf(context)?.display;
    final size = MediaQuery.of(context).size;
    final size2 = MediaQuery.sizeOf(context);
    final orientationAsString =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? 'landscape'
            : 'portrait';

    final textScaleFactor =
        WidgetsBinding.instance.platformDispatcher.textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(
                'Screen size (logical pixels): ${size.width}x${size.height}, Orientation: $orientationAsString, Text scale: $textScaleFactor'),
            Text(
                'Screen size (logical pixels): ${size2.width}x${size2.height}, Orientation: $orientationAsString, Text scale: $textScaleFactor'),
            Text(
                'Screen size (logical pixels): ${dsp?.size.width ?? 0}x${dsp?.size.height ?? 0}, Orientation: $orientationAsString, Text scale: $textScaleFactor'),
            Text(
                'Screen pixel ratio: ${dsp?.devicePixelRatio ?? 0}'),
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size(200, 200)),
              child: const AspectRatio(
                aspectRatio: 16 / 9,
                child: ColoredBox(
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text('Ratio: 16:9'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
              height: 50,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(Icons.home),
              ),
            ),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue, width: 2)),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: 1 / 4,
                    heightFactor: 1 / 4,
                    child: ColoredBox(color: Colors.amberAccent),
                  ),
                )),
            Flexible(
              child: LayoutBuilder(
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
                                if (index + increment < _items.length - 1)
                                  SizedBox(
                                    width: 200,
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.add_box_outlined),
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
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 3, context: context),
    );
  }
}
