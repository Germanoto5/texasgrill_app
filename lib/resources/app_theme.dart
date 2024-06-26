import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
    bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    colorScheme: _colorScheme(),
    fontFamily: 'OpenSans',
    useMaterial3: true,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Color(0xFF2B2824),
    unselectedItemColor:Color(0xFF766C62),
    selectedItemColor: Color(0xffF0F4F5),
  );
}

ColorScheme _colorScheme() {
  return ColorScheme.fromSeed(
      seedColor: const Color(0xff242424),
      primary: const  Color(0xffC3613A),
      secondary: const Color(0xFFB08A4C),
      tertiary: const Color(0xffD8E0E3),
      tertiaryContainer: const Color(0xffF0F4F5),
      surface: const  Color(0xFF2B2824),
      surfaceContainerLow: const Color(0xFF4E473E),
      inverseSurface: const Color(0xff4D4740),

      );
}
