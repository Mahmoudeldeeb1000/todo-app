import 'package:flutter/material.dart';

class AppTheme{
  final ThemeData lightMode=ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: Color(0xffF9FEFB),
      appBarTheme: AppBarTheme(
          color: Color(0xffF9FEFB)
      ),
      textTheme: TextTheme(
          titleLarge:  TextStyle(
              fontSize: 22,fontWeight: FontWeight.w600,
              color: Colors.black),
          bodySmall: TextStyle(
              color: Colors.black,
              fontSize: 14,fontWeight: FontWeight.w500
          )
      )

  );
  final ThemeData darkMode=ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff18283A),
      appBarTheme: AppBarTheme(
          color: Color(0xff2A4463)
      ),
      textTheme: TextTheme(
          titleLarge:  TextStyle(
              color: Colors.white,
              fontSize: 22,fontWeight: FontWeight.w600
          ),
          bodySmall: TextStyle(
              color: Color(0xffF0F0F0),
              fontSize: 14,fontWeight: FontWeight.w500
          )
      )
  );
}