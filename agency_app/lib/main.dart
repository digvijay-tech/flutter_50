import 'package:flutter/material.dart';

// loading all screens
import 'package:agency_app/screens/home.dart';
import 'package:agency_app/screens/settings.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyAgency(),
        "/settings": (context) => const Settings(),
      },
    ),
  );
}
