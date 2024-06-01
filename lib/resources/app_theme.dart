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
      seedColor: const Color(0xff242424),
      primary: const Color(0xFF242424),
      secondary: const Color(0xFFF0F0F0),
      tertiary: const Color(0xffBF4B0D),
      inversePrimary: const Color(0xff4B34AE),
      surface: const Color(0xFF7B7B7B),
      surfaceContainer: const Color(0xFFDFDFDF),
      inverseSurface: const Color(0xff242424),

      );
}
