import 'package:chapter13/models/todo_item.dart';
import 'package:flutter/material.dart';

final class AppState extends ChangeNotifier {
  final todoItems = List<TodoItem>.unmodifiable(const [
    TodoItem(title: 'Item 1', details: 'Item 1 details'),
    TodoItem(title: 'Item 2', details: 'Item 2 details'),
  ]);

  var _todoItemsIndex = 0;
  int get todoItemsIndex => _todoItemsIndex;
  set todoItemsIndex(int newTodoItemIndex) {
    if (newTodoItemIndex != _todoItemsIndex) {
      _todoItemsIndex = newTodoItemIndex;
      notifyListeners();
    }
  }
}



