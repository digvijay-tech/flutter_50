import "package:flutter/material.dart";

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ColorControls(),
      ),
    ),
  );
}

class ColorControls extends StatefulWidget {
  const ColorControls({super.key});

  @override
  State<ColorControls> createState() => _ColorControlsState();
}

class _ColorControlsState extends State<ColorControls> {
  // creating variable to store color
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selectedColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 20.0,
            ),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  selectedColor = Colors.blue;
                });
              },
              child: const Text(
                "Blue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 20.0,
            ),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  selectedColor = Colors.green;
                });
              },
              child: const Text(
                "Green",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 20.0,
            ),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
              ),
              onPressed: () {
                setState(() {
                  selectedColor = Colors.amber;
                });
              },
              child: const Text(
                "Yellow",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
