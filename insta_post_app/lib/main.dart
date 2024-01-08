import "package:flutter/material.dart";
import "package:insta_post_app/screens/Home.dart";
import "package:insta_post_app/theme/theme.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: Home(),
    ),
  );
}
