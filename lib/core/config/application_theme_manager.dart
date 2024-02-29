import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xff5d9cec);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xffdfecdb),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      toolbarHeight: 100,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xffc8c9cb),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffc8c9cb),
        size: 30,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.white, width: 4),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xff060e1e),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      toolbarHeight: 100,
      iconTheme: IconThemeData(
        color: Color(0xff060e1e),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Color(0xffc8c9cb),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffc8c9cb),
        size: 30,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Color(0xff060e1e), width: 4),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      color: Color(0xff141922),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xff060e1e),
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
