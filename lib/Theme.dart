import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    //  primaryColor: Color(0xff7474BF),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xff7474BF),
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: TextStyle(
        color: Color(0xff808493),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16 ,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF)

        ),
        backgroundColor: Color(0xff7474BF),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

//*
//*
