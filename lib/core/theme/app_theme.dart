import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
    fontFamily: 'Roboto',
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
