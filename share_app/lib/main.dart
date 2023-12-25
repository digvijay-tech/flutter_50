import "package:flutter/material.dart";
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ShareApp(),
        ),
      ),
    ),
  );
}

class ShareApp extends StatefulWidget {
  const ShareApp({super.key});

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          print("Share something here..");
          // share content on click
          Share.share(
            'Checkout my website: https://digvijay.tech or email me at connecttodigvijay@gmail.com',
          );
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue),
        ),
        child: const Text(
          "Share Now..",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
