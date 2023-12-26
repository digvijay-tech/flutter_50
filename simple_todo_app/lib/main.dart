import "package:flutter/material.dart";
// import 'package:provider/provider.dart';

// loading widgets
import "package:simple_todo_app/widgets/inputControls.dart";
import "package:simple_todo_app/widgets/todoList.dart";

// entry point for app
void main() => runApp(const SimpleTodoApp());

// Main Todo App
class SimpleTodoApp extends StatelessWidget {
  const SimpleTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Simple Todo App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: TodoBody(),
        ),
      ),
    );
  }
}

// Todo object class
class Todo {
  String? text;
  bool? isCompleted;

  Todo(this.text, this.isCompleted);
}

class TodoBody extends StatefulWidget {
  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  List<dynamic> todos = [];

  // handling child to parent data transfer
  void todoInput(String todoText) {
    setState(() {
      todos.add(Todo(todoText, false));
    });
  }

  // handling data change from child to parent
  void handleChange(List data) {
    setState(() {
      todos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: TodoList(
            data: todos,
            callback: handleChange,
          ),
        ),
        Expanded(
          flex: 1,
          child: InputControl(
            callback: todoInput,
          ),
        ),
      ],
    );
  }
}
