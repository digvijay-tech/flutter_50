import "package:flutter/material.dart";
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Drum(),
        ),
      ),
    ),
  );
}

class Drum extends StatefulWidget {
  const Drum({super.key});

  @override
  State<Drum> createState() => _DrumState();
}

class _DrumState extends State<Drum> {
  // initializing AudioPlayer instance
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 1; i <= 9; i++)
            GestureDetector(
              onTap: () async {
                print("tapped s1..");
                await player.play(AssetSource('sound/s$i.wav'));
              },
              child: Container(
                padding: const EdgeInsets.all(28.0),
                color: Colors.amber,
                child: Center(
                  child: Text("Drum $i"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
