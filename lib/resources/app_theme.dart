import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
    bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    colorScheme: _colorScheme(),
    useMaterial3: true,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor:   Color(0xFFDEDEDE),
    selectedItemColor:   Color(0xff6892B4),
  );
}

ColorScheme _colorScheme() {
  return ColorScheme.fromSeed(
      seedColor: const Color(0xff0B0B0E),
      primary: const Color(0xFF393e46),
      secondary: const Color(0xFFF0F0F0),
      tertiary: const Color(0xffBD2D2D),
      surface: const Color(0xFF5F6089),
      surfaceContainer: const Color(0xFFDFDFDF),
      inverseSurface: const Color(0xff0B0B0E)
      );
}
