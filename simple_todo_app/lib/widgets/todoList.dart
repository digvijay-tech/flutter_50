import "package:flutter/material.dart";

// display todos
class TodoList extends StatefulWidget {
  final List data;
  final void Function(List) callback;

  TodoList({
    required this.data,
    required this.callback,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return (widget.data.isEmpty)
        ? const Center(
            child: Text("No Todos Found!"),
          )
        : ListView(
            children: [
              for (int i = 0; i < widget.data.length; i++)
                Container(
                  height: 100.0,
                  color: const Color.fromRGBO(99, 110, 114, 0.328),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // to check and uncheck a todo item
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            if (!widget.data[i].isCompleted) {
                              widget.data[i].isCompleted = true;
                            } else {
                              widget.data[i].isCompleted = false;
                            }

                            // callback for handling change on data
                            widget.callback(widget.data);
                          },
                          icon: (widget.data[i].isCompleted as bool)
                              ? const Icon(Icons.check_box)
                              : const Icon(Icons.check_box_outline_blank),
                        ),
                      ),
                      // to display actual todo text
                      Expanded(
                        flex: 10,
                        child: Text(
                          widget.data[i].text as String,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      // to delete todo item
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            widget.data.removeAt(i);

                            // callback for handling change on data
                            widget.callback(widget.data);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
