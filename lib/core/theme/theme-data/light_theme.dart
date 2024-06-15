import 'package:flutter/material.dart';

ThemeData getLightThemeData() => ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 27,
        ),
      ),
      primaryColor: const Color.fromRGBO(0, 87, 135, 1.0),
      primaryColorLight: Colors.orangeAccent,
      primaryColorDark: Colors.white.withOpacity(0.9),
      secondaryHeaderColor: const Color.fromRGBO(17, 39, 59, 1.0),
      colorScheme: ColorScheme.light(
        primary: const Color.fromRGBO(0, 235, 235, 1.0),
        onPrimary: const Color.fromRGBO(0, 235, 235, 1.0),
        secondary: const Color.fromRGBO(0, 185, 185, 1.0),
        onSecondary: const Color.fromRGBO(0, 170, 220, 1.0),
        surface: Colors.white.withOpacity(0.9),
        onSurface: Colors.black54,
        onError: Colors.red,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            shadows: [
              BoxShadow(offset: Offset(1, 2)),
            ],
            color: Colors.white),
        titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
          shadows: [
            BoxShadow(offset: Offset(1, 2)),
          ],
        ),
        titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            shadows: [
              BoxShadow(offset: Offset(1, 2)),
            ],
            color: Colors.white),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.black45,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.black45,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.black26,
        ),
        labelLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white70,
        ),
        displayLarge: TextStyle(
          letterSpacing: 1,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.black45,
        ),
        displayMedium: TextStyle(
          letterSpacing: 2,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.black45,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.black26,
        ),
        headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        size: 27,
        color: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.black45,
      ),
      navigationBarTheme: NavigationBarThemeData(
        iconTheme: const WidgetStatePropertyAll(
          IconThemeData(
            color: Colors.white,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? const TextStyle(color: Colors.white, fontFamily: 'Roboto')
              : const TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.transparent,
        height: 60,
      ),
      fontFamily: "Cairo",
    );
