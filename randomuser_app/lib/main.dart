import 'package:flutter/material.dart';
import 'package:randomuser_app/widgets/UserDisplay.dart';

void main() {
  runApp(const RandomUserApp());
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "Random User",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const SafeArea(
          child: UserDisplay(),
        ),
      ),
    );
  }
}
