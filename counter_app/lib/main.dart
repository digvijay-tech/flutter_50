import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Counter App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const Center(
          child: CounterDisplay(),
        ),
      ),
    ),
  );
}

class CounterDisplay extends StatefulWidget {
  const CounterDisplay({super.key});

  @override
  State<CounterDisplay> createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Click the button to update..",
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              color: Colors.blue,
              iconSize: 40.0,
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              color: Colors.red,
              iconSize: 40.0,
              onPressed: () {
                setState(() {
                  if (count <= 0) {
                    count = 0;
                    return;
                  }

                  count--;
                });
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              color: Colors.amber,
              iconSize: 40.0,
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
