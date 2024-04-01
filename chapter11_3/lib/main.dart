import 'dart:math';

import 'package:chapter11_3/my_clipper.dart';
import 'package:chapter11_3/my_future_builder_widget.dart';
import 'package:chapter11_3/my_layout.dart';
import 'package:chapter11_3/my_progress_bar.dart';
import 'package:chapter11_3/my_stream_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _cupertinoSegmentedControlGroupValue = 0;

  Future<int> getRandomNumber() {
    return Future<int>.delayed(const Duration(seconds: 2), () {
      return Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initializing Cupertino Single Page App
    // return const CupertinoApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: CupertinoThemeData(),
    //   home: CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       leading: Icon(CupertinoIcons.refresh_circled),
    //       middle: Text('Single page'),
    //       trailing: Icon(CupertinoIcons.add),
    //     ),
    //     child: Center(
    //       child: Text('Page content'),
    //     ),
    //   ),
    // );

    // Initializing Cupertino Tab App
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.info), label: 'Info'),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CupertinoButton(
                                    onPressed: null, child: Text('Disabled')),
                                CupertinoButton(
                                  child: const Text('Enabled'),
                                  onPressed: () {},
                                ),
                                const CupertinoButton.filled(
                                  onPressed: null,
                                  child: Text('Disabled'),
                                ),
                                CupertinoButton.filled(
                                  child: const Text('Enabled'),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              child: CupertinoSegmentedControl<int>(
                                children: const <int, Widget>{
                                  0: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 20,
                                    ),
                                    child: Text('A'),
                                  ),
                                  1: Text('B'),
                                  2: Text('C'),
                                },
                                onValueChanged: (newValue) {
                                  debugPrint('$newValue');

                                  setState(() {
                                    _cupertinoSegmentedControlGroupValue =
                                        newValue;
                                  });
                                },
                                groupValue:
                                    _cupertinoSegmentedControlGroupValue,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              child: MyProgressBar(
                                progressValue: 63,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Opacity(
                              opacity: 0.5,
                              child: Text('Opacity 50%'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    color: Colors.blue,
                                  ),
                                ),
                                ClipOval(
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    color: Colors.blue,
                                  ),
                                ),
                                ClipOval(
                                  clipper: MyClipper(),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: MyFutureBuilderWidget(),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: MyStreamBuilderWidget(),
                          ),
                        ],
                      ));
                },
              );
            default:
              return CupertinoTabView(
                builder: (context) {
                  return const Center(
                    child: Text('Home Page'),
                  );
                },
              );
          }
        },
      ),
    );

    // Initializing Material App
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyLayout(title: 'Flutter Demo Home Page'),
    // );
  }
}
