import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_texts.dart';

class RegesterScreen extends StatelessWidget {
  const RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Image.asset(AppImages.regester),

              Container(
                height: 120,
                width: 120,
                child: Icon(Icons.add_a_photo,color: AppColor.bottom1,size: 40,),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.bottom1),
                borderRadius: BorderRadius.circular(20)
              ),
              ),
              Text(AppTexts.addphoto),
              SizedBox(height: 40,),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColor.bottom1,
                    ),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide( color: AppColor.bottom1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: "Your name",
                  floatingLabelStyle: TextStyle(
                    color: Colors.black
                  ),
                  hintText: "Enter your name",hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6E6A7C).withOpacity(.5),
                )
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

                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(AppTexts.getStarted,
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColor.white,
                          ) ,
                        ),
                      ),
                    ],
                  ),


                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
