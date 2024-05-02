import 'package:chapter13_3_2/models/active_page.dart';
import 'package:chapter13_3_2/models/todo_item.dart';
import 'package:chapter13_3_2/navigation_state_widget.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  final String title;

  const TodosPage({super.key, required this.title});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final todoItems = [
    const TodoItem(title: 'Item 1', details: 'Item 1 details'),
    const TodoItem(title: 'Item 2', details: 'Item 2 details'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoItems[index].title),
                onTap: () {
                },
              );
            },
          )),
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
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        onTap: (int selectedIndex) {
          switch (selectedIndex) {
            case 0:
              context.navigationState.pagesStack.add(ActivePage.homePage);
              context.navigationState.currentPage.value = ActivePage.homePage;
              break;
            case 2:
              context.navigationState.pagesStack.add(ActivePage.aboutPage);
              context.navigationState.currentPage.value = ActivePage.aboutPage;
              break;
          }
        },
      ),
    );
  }
}