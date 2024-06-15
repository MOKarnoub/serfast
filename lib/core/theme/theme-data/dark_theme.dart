import 'package:flutter/material.dart';

ThemeData getDarkThemeData() => ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 22,
      ),
    ),
    scaffoldBackgroundColor: const Color(0x163978FF),
    primaryColor: const Color.fromRGBO(0, 87, 135, 1.0),
    secondaryHeaderColor: const Color.fromRGBO(17, 39, 59, 1.0),
    primaryColorLight: Colors.orangeAccent,
    primaryColorDark: const Color(0x163978FF),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(0, 185, 185, 1.0),
      onPrimary: Color.fromRGBO(0, 170, 220, 1.0),
      secondary: Color.fromRGBO(0, 87, 135, 1.0),
      onSecondary: Color.fromRGBO(0, 63, 99, 1.0),
      surface: Color.fromRGBO(16, 29, 44, 1.0),
      onSurface: Color.fromRGBO(32, 47, 71, 1.0),
      onError: Colors.red,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          shadows: [
            BoxShadow(offset: Offset(1, 2)),
          ],
          color: Colors.white),
      titleMedium: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        color: Colors.white,
        shadows: [
          BoxShadow(offset: Offset(1, 2)),
        ],
      ),
      titleSmall: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          shadows: [
            BoxShadow(offset: Offset(1, 2)),
          ],
          color: Colors.white),
      bodyLarge: const TextStyle(
        fontSize: 20,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        fontFamily: "Cairo",
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        color: Colors.white,
      ),
      labelMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
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
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 4),
            ),
          ]),
      displayMedium: TextStyle(
          letterSpacing: 2,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 4),
            ),
          ]),
      displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 4),
            ),
          ]),
      headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      size: 25,
      color: Colors.white,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    navigationBarTheme: NavigationBarThemeData(
      iconTheme:  WidgetStateProperty.all(
        const IconThemeData(color: Colors.white, size: 25),
      ),
      // labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
      //   (Set<WidgetState> states) => states.contains(WidgetState.selected)
      //       ? const TextStyle(color: Colors.white, fontFamily: 'Roboto')
      //       : const TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
      // ),
      backgroundColor: Colors.transparent,
      height: 60,
    ),
    fontFamily: "Cairo",
    datePickerTheme: DatePickerThemeData(

        backgroundColor: const Color.fromRGBO(16, 29, 44, 1.0),
        dayForegroundColor: WidgetStateProperty.all(Colors.white),
        dayOverlayColor: WidgetStateProperty.all(Colors.orangeAccent),
        dividerColor: Colors.white,
        elevation: 2,
        rangePickerHeaderForegroundColor: Colors.white,
        headerBackgroundColor: Colors.orangeAccent,
        headerForegroundColor: Colors.white,
        todayBackgroundColor: WidgetStateProperty.all(Colors.transparent),
        todayForegroundColor: WidgetStateProperty.all(Colors.orangeAccent),
        yearForegroundColor:
            WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
        weekdayStyle: TextStyle(color: Colors.white.withOpacity(0.25)),
    ),
        
);
