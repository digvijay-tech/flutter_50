import "package:flutter/material.dart";

// input control
class InputControl extends StatefulWidget {
  final void Function(String) callback;
  const InputControl({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<InputControl> createState() => _InputControlState();
}

class _InputControlState extends State<InputControl> {
  // todo input controller
  late TextEditingController _todoInputController;

  // handle add button's state (enabled/disabled)
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _todoInputController = TextEditingController();
  }

  @override
  void dispose() {
    _todoInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              controller: _todoInputController,
              maxLength: 30,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                label: Text("Enter Todo.."),
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                if (_todoInputController.text.trim().isEmpty) {
                  isEnabled = false;
                } else {
                  isEnabled = true;
                }

                if (isEnabled) {
                  // sending data with parent using callback
                  widget.callback(_todoInputController.text);
                  // clearing input
                  _todoInputController.text = "";
                }
              },
              color: Colors.blue,
              iconSize: 28.0,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
