import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Oversizing'),
                SizedBox(
                  width: 160,
                  child: Row(
                    children: [
                      container,
                      container,
                      container,
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Expanded widget'),
                SizedBox(
                  width: 200,
                  child: Row(
                    // Fills all available space
                    children: [
                      Expanded(child: container),
                      Expanded(child: container),
                      Expanded(child: container),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Flexible widget'),
                SizedBox(
                  width: 200,
                  child: Row(
                    // Does not fill all available space
                    children: [
                      Flexible(child: container),
                      Flexible(child: container),
                      Flexible(child: container),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wrap widget'),
                SizedBox(
                  width: 160,
                  child: Wrap(
                    children: [
                      container,
                      container,
                      container,
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Table widget'),
                Table(
                  defaultColumnWidth: const FixedColumnWidth(60),
                  children: [
                    for (var i = 0; i < 5; i++)
                      TableRow(
                        children: [
                          for (var j = 0; j < 10; j++)
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                color: Colors.black26,
                                child: Text('$i, $j'),
                              ),
                            )
                        ]
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
