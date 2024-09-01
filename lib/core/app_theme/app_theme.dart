import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_colors.dart';

class AppTheme{
  final ThemeData lightMode=ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: const Color(0xffF9FEFB),
      appBarTheme: AppBarTheme(
          color: AppColor.appbarcolor
      ),
      textTheme: const TextTheme(
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
      scaffoldBackgroundColor: const Color(0xff18283A),
      appBarTheme: const AppBarTheme(
          color: Color(0xff2A4463)
      ),
      textTheme: const TextTheme(
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