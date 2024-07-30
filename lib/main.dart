import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_theme/app_theme.dart';
import 'package:todo/features/controler/theme_controler.dart';
import 'package:todo/features/onbording/views/onbording_Screen.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightMode,
      themeMode:Provider.of<ThemeProvider>(context).switchValue? ThemeMode.dark: ThemeMode.light,
      darkTheme: AppTheme().darkMode,
      debugShowCheckedModeBanner:false,
      home: OnbordingScreen()
    );
  }
}