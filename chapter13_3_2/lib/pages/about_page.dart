import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String title;
  final Function onNavigateToHomePage;
  final Function onNavigateToTodosPage;

  const AboutPage({
    super.key,
    required this.title,
    required this.onNavigateToHomePage,
    required this.onNavigateToTodosPage
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'About Chapter 13 app',
            )
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
            icon: Icon(Icons.list),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.amber[800],
        onTap: (int selectedIndex) {
          switch (selectedIndex) {
            case 0:
              onNavigateToHomePage();
              break;
            case 1:
              onNavigateToTodosPage();
              break;
          }
        },
      ),
    );
  }
}