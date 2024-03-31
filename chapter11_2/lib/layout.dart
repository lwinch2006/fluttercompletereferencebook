import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final String title;

  const Layout({super.key, required this.title});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _counter = 0;
  int _currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void onBottomNavigationBarItemTap(
      BuildContext context, int selectedIndex) async {
    switch (selectedIndex) {
      case 0:
        await showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Info'),
                //shape: borderShape,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });

        if (context.mounted) {
          showModalBottomSheet<void>(
              context: context,
              elevation: 5,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Info'),
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.cancel)),
                    ],
                  ),
                );
              });
        }

        break;

      case 1:
        var response = await showDialog<String?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Choose programming language'),
              children: [
                SimpleDialogOption(
                  child: const Text('C#'),
                  onPressed: () => Navigator.of(context).pop('C#'),
                ),
                SimpleDialogOption(
                  child: const Text('Go'),
                  onPressed: () => Navigator.of(context).pop('Go'),
                ),
                SimpleDialogOption(
                  child: const Text('Flutter'),
                  onPressed: () => Navigator.of(context).pop('Flutter'),
                ),
              ],
            );
          },
        );

        response = 'User chose: $response';

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response),
            duration: const Duration(seconds: 2),
            elevation: 5,
          ));
        }

        debugPrint(response);
        break;
    }

    setState(() {
      _currentPageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info),
              onTap: () {},
            ),
          ],
        ),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int selectedIndex) =>
            onBottomNavigationBarItemTap(context, selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
