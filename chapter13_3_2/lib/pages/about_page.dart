import 'package:chapter13_3_2/models/active_page.dart';
import 'package:chapter13_3_2/navigation_state_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String title;

  const AboutPage({super.key, required this.title});

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
              context.navigationState.pagesStack.add(ActivePage.homePage);
              context.navigationState.currentPage.value = ActivePage.homePage;
              break;
            case 1:
              context.navigationState.pagesStack.add(ActivePage.todosPage);
              context.navigationState.currentPage.value = ActivePage.todosPage;
              break;
          }
        },
      ),
    );
  }
}