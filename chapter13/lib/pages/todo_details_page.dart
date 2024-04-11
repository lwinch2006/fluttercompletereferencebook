import 'package:chapter13/app_state_widget.dart';
import 'package:chapter13/models/todo_item.dart';
import 'package:flutter/material.dart';

class TodoDetailsPage extends StatelessWidget {
  final String title;
  final String todoTitle;
  final String todoDetails;

  const TodoDetailsPage({
    super.key,
    required this.title,
    required this.todoTitle,
    required this.todoDetails,
  });

  @override
  Widget build(BuildContext context) {
    final todoItem = ModalRoute.of(context)!.settings.arguments! as TodoItem;
    final appState = AppStateWidget.of(context).appState;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop('Returning from Todo Details Page');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //'Title: $todoTitle',
              //'Title: ${todoItem.title}',
                'Title: ${appState.todoItems[appState.todoItemsIndex].title}'
            ),
            Text(
              //'Details: $todoDetails',
              //'Details: ${todoItem.details}',
              'Details: ${appState.todoItems[appState.todoItemsIndex].details}',
            ),
          ],
        ),
      ),
    );
  }
}
