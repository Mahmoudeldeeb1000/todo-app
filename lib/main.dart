import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/app_theme/app_theme.dart';
import 'package:todo/features/controler/theme_controler.dart';
import 'package:todo/features/home/presentetion/controller/home_controller.dart';
import 'package:todo/features/onbording/views/onbording_Screen.dart';
void main() async{
  await Hive.initFlutter();
  await Hive.openBox('settingBox');
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (c)=>ThemeProvider()),
      ChangeNotifierProvider(create: (c)=>HomeProvider())
    ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).setSwitchValueFromHive();

    return MaterialApp(
      theme: AppTheme().lightMode,
      themeMode:Provider.of<ThemeProvider>(context).switchValue==true? ThemeMode.dark: ThemeMode.light,
      darkTheme: AppTheme().darkMode,
      debugShowCheckedModeBanner:false,
      home: const OnbordingScreen()
    );
  }
}