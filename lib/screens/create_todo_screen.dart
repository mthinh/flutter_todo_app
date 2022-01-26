import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  late TextEditingController _controller;
  late TodosController _todoController;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit(String value) {
    _todoController.addTodo(value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _todoController = Provider.of<TodosController>(context);
    return const Center(child: CircularProgressIndicator());

    // return Scaffold(
    //     appBar: AppBar(title: const Text('Create todo')),
    //     body: Padding(
    //       padding: const EdgeInsets.all(32.0),
    //       child: Column(
    //         children: [
    //           TextField(
    //             onSubmitted: onSubmit,
    //             controller: _controller,
    //           ),
    //           TextButton(
    //               onPressed: () => onSubmit(_controller.value.text),
    //               child: const Text('Submit'))
    //         ],
    //       ),
    //     ));
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
