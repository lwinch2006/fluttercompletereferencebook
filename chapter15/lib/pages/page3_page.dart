import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  final String title;

  const Page3({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var checkboxChecked = false;

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
            const Text(
              'Scaled text',
              textScaler: TextScaler.linear(1.5),
            ),
            MergeSemantics(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: checkboxChecked,
                    onChanged: (value) {
                      setState(() {
                        checkboxChecked = !checkboxChecked;
                      });
                    },
                  ),
                  const Text('Click me'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 3, context: context),
    );
  }
}
