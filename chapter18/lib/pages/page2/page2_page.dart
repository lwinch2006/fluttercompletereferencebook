import 'dart:math';

import 'package:chapter18/widgets/chapter18_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  final String title;

  const Page2({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String _numberGameStatus = 'Test';
  int _numberGameValue = Random().nextInt(100) + 1;

  void updateStatusAndRestart(String status) {
    setState(() {
      _numberGameStatus = status;
      _numberGameValue = Random().nextInt(100) + 1;
    });
  }

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
                const Text('Tap container'),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Container got tapped');
                  },
                  onDoubleTap: () {
                    debugPrint('Container got double tapped');
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Drag & Drop game'),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DragTarget<int>(
                  onAccept: (data) {
                    updateStatusAndRestart('Odd number accepted: $data');
                  },
                  onWillAccept: (data) {
                    return data?.isOdd ?? false;
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.lime,
                      child: const Center(
                        child: Text('Odd'),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 40,
                ),
                Draggable<int>(
                  data: _numberGameValue,
                  feedback: Material(
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.black12,
                      child: Center(
                        child: Text('$_numberGameValue'),
                      ),
                    ),
                  ),
                  child: Text('$_numberGameValue'),
                ),
                const SizedBox(
                  width: 40,
                ),
                DragTarget<int>(
                  onAccept: (data) {
                    updateStatusAndRestart('Even number accepted: $data');
                  },
                  onWillAccept: (data) {
                    return data?.isEven ?? false;
                  },
                  builder: (context, _, __) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.lightBlueAccent,
                      child: const Center(
                        child: Text('Even'),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(_numberGameStatus),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Move mouse over me'),
                const SizedBox(
                  width: 20,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.forbidden,
                  onHover: (event) {
                    debugPrint('Mouse position ${event.position}');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter18BottomNavigationBar(
          currentSelectedIndex: 2, context: context),
    );
  }
}
