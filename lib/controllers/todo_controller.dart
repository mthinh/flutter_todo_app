import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo() {
    _todos.add(createFakeTodo());
    print(_todos);
    notifyListeners();
  }

  Todo createFakeTodo() {
    DateTime timestamp = DateTime.now();
    return Todo(title: timestamp.toString());
  }
}
