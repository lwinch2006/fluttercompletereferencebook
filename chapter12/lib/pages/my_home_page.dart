import 'package:chapter12/extensions/build_context_extensions.dart';
import 'package:chapter12/my_app_state_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RestorationMixin {
  final _counter = RestorableInt(0);

  // Ephemeral state
  // int _counter = 0;

  @override
  String? get restorationId => 'my_home_page_state';


  void _incrementCounter(BuildContext context) {
    // Ephemeral state
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('MyAppStateWidget got changed');
  }

  @override
  Widget build(BuildContext context) {
    // Not needed in case of using extension method
    // final appState = MyAppStateWidget.of(context).state;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListenableBuilder(
                  listenable: context.state, /* appState */
                  builder: (context, _) {
                    return Text(
                      '${context.state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                const Text(' - '),
                ListenableBuilder(
                  listenable: _counter, /* appState */
                  builder: (context, _) {
                    return Text(
                      '${_counter.value}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                const Text(' - '),
                ValueListenableBuilder(
                    valueListenable: context.counterState,
                    builder: (context, value, _) {
                      return Text(
                        '$value',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //_incrementCounter(context);
                    //appState.counter++;
                    context.state.counter++;
                    context.counterState.value++;
                  },
                  child: const Text(' Increment '),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                ),
                ElevatedButton(
                  onPressed: () {
                    //appState.counter--;
                    context.state.counter--;
                    context.counterState.value--;
                  },
                  child: const Text('Decrement'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
