import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/regester/views/regester_Screen.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Image.asset(AppImages.onbording),
             SizedBox(height: 65,),
             Text("ToDo List \n Daily Task",
               textAlign: TextAlign.center,
               style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
             ),
             SizedBox(height: 23,),

             Text("This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!",
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: AppColor.gray,
                 fontSize: 15,
                 fontWeight: FontWeight.w400
               ),

             ),
             SizedBox(height: 50,),
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
                      return RegesterScreen();
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
