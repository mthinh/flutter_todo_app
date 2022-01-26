import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodosController extends ChangeNotifier {
  final List<Todo> _todos = <Todo>[];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void addTodo(String value) {
    _todos.add(Todo(title: value, done: false));
    notifyListeners();
  }

  void updateTodo({required int index, required Todo todo}) {
    _todos[index] = todo;
    notifyListeners();
  }

  Todo createFakeTodo() {
    DateTime timestamp = DateTime.now();
    return Todo(title: timestamp.toString(), done: false);
  }
}
