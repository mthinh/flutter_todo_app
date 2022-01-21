import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class Todos extends StatelessWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TodoController(),
      child: Consumer<TodoController>(
        builder: (context, todoCtrl, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Todo App',
                ),
              ),
              body: ListView.builder(
                  itemCount: todoCtrl.todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(todoCtrl.todos[index].title);
                  }),
              floatingActionButton: FloatingActionButton(
                onPressed: todoCtrl.addTodo,
              ));
        },
      ),
    );
  }
}
