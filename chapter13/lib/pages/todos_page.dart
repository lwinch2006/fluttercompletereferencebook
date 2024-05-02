import 'package:chapter13/app_state_widget.dart';
import 'package:chapter13/models/todo_item.dart';
import 'package:chapter13/pages/todo_details_page.dart';
import 'package:chapter13/routes.dart';
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

  // This method does not allowing using const TodoDetailsPage() constructor
  void showTodoDetailsWithPush(int selectedIndex) async {
    debugPrint('Using anonymous push() method');

    await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => TodoDetailsPage(
            title: 'Flutter Demo Todo Details Page',
            todoTitle: todoItems[selectedIndex].title,
            todoDetails: todoItems[selectedIndex].details)));
  }

  void showTodoDetailsWithPushNamed(int selectedIndex) async {
    debugPrint('Using pushName() method');

    var response = await Navigator.of(context).pushNamed(
        todoDetailsPageRouteName,
        arguments: todoItems[selectedIndex]) as String;

    debugPrint(response);
  }

  void showTodoDetailsWithInheritedWidget(int selectedIndex) async {
    debugPrint('Using pushNamed() method with InheritedWidget');
    if (!mounted) {
      return;
    }

    var appState = AppStateWidget.of(context).appState;
    appState.todoItemsIndex = selectedIndex;

    var response = await Navigator.of(context)
        .pushNamed(todoDetailsPageRouteName) as String;

    debugPrint(response);
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateWidget.of(context).appState;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        //itemCount: todoItems.length,
        itemCount: appState.todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            //title: Text(todoItems[index].title),
            title: Text(appState.todoItems[index].title),
            onTap: () {
              // This method does not allowing using const TodoDetailsPage() constructor
              // showTodoDetailsWithPush(index);

              // This method can be difficult to use when passing arguments between many Routes/Pages
              // showTodoDetailsWithPushNamed(index);

              showTodoDetailsWithInheritedWidget(index);
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
          navigateByBottomNavigationBarSelectedIndex(context, 1, selectedIndex);
        },
      ),
    );
  }
}
