import 'package:flutter/material.dart';

import '../../../core/utils/app_Images.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_texts.dart';
import '../../regester/views/regester_Screen.dart';

class OnbordingBody extends StatelessWidget {
  const OnbordingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(

    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Image.asset(AppImages.onbording),
    const SizedBox(height: 65,),
    Text("ToDo List \n Daily Task",
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge,
    ),
    const SizedBox(height: 23,),
    Text("This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!",
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.bodySmall

  ),
  const SizedBox(height: 50,),
  Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
  colors:[
  AppColor.bottom1,
  AppColor.bottom2
  ]
  )
  ),
  child: MaterialButton(
  onPressed: (){
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
  return const RegesterScreen();
  },));

  },
  child: Row(
  children: [
  Expanded(
  child: Text(AppTexts.letsStarted,
  textAlign: TextAlign.center,
  style:TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20,
  color: AppColor.white,
  ) ,
  ),
  ),
  Image.asset(AppImages.arrow),
  ],
  ),
  ),
  )
  ],
  ),
  ),
  );
  }
}
