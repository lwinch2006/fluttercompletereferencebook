import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final container = Container(
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
          children: <Widget>[
            Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue, width: 2)),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.ac_unit),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.access_alarm_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.account_balance_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 0, context: context),
    );
  }
}
