import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/todo_controller.dart';
import 'package:flutter_todo_app/screens/create_todo_screen.dart';
import 'package:provider/provider.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  void navigateToCreateTodoScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CreateTodoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosController>(
      builder: (context, todoCtrl, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Todo App',
              ),
            ),
            body: todoCtrl.todos.isNotEmpty
                ? ListView.builder(
                    itemCount: todoCtrl.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      var currentTodo = todoCtrl.todos[index];
                      var done = currentTodo.done;
                      return Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    value: done,
                                    onChanged: (value) {
                                      currentTodo.done = value!;
                                      todoCtrl.updateTodo(
                                          index: index, todo: currentTodo);
                                    }),
                                Text(currentTodo.title),
                              ]),
                        ),
                      );
                    })
                : const Center(child: Text('Test github actions 3')),
            floatingActionButton: FloatingActionButton(
              onPressed: () => navigateToCreateTodoScreen(context),
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ScreenB()));
      },
    ));
  }
}
