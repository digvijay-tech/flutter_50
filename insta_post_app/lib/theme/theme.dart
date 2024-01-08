import "package:flutter/material.dart";

class AppThemes {
  // light theme setup
  static final lightTheme = ThemeData(
    useMaterial3: true,

    // defining default light theme and colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2C3E50),
      brightness: Brightness.light,
    ),
  );

  // dark theme setup
  static final darkTheme = ThemeData(
    useMaterial3: true,

    // defining dafault dark theme and colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2C3E50),
      brightness: Brightness.dark,
    ),
  );
}
