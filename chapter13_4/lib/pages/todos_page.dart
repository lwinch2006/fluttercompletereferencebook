import 'package:chapter13_4/models/todo_item.dart';
import 'package:chapter13_4/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  OverlayEntry? popup;

  removePopup() {
    if (popup != null) {
      popup!.remove();
      popup = null;
    }
  }

  createPopup() {
    removePopup();

    popup = OverlayEntry(
      builder: (context) {
        return Positioned(
            left: 30,
            right: 30,
            bottom: 10,
            child: Container(
              height: 20,
              color: Colors.lime,
            ));
      },
    );

    Overlay.of(context).insert(popup!);
  }

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
              // Alternative 1
              //context.push(todoDetailsPagePath, extra: '${todoItems[index].title}|${todoItems[index].details}');

              // Alternative 2
              //context.push('$todoDetailsPagePath?todoTitle=${todoItems[index].title}&todoDetails=${todoItems[index].details}');

              // Alternative 3
              context.push(
                  '$todoDetailsPagePath/${todoItems[index].title}/${todoItems[index].details}');

              switch (index) {
                case 0:
                  createPopup();
                  break;
                case 1:
                  removePopup();
                  break;
              }

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
              context.push(homePagePath);
              break;
            case 2:
              context.push(aboutPagePath);
              break;
          }
        },
      ),
    );
  }
}
