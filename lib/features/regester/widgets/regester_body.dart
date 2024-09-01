import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/features/home/presentetion/views/home_screen.dart';
import '../../../core/utils/app_Images.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_texts.dart';

class RegesterBody extends StatefulWidget {
  const RegesterBody({super.key});
  @override
  State<RegesterBody> createState() => _RegesterBodyState();
}
class _RegesterBodyState extends State<RegesterBody> {
  XFile? myPhoto;
  Future<XFile?> pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Image.asset(AppImages.regester),
            GestureDetector(
              onTap: (){
                pickImage().then((value) {
                  myPhoto = value;
                  setState(() {
                  });
                });
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.bottom1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: myPhoto==null? Icon(Icons.add_a_photo,color: AppColor.bottom1,size: 40,):
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(File(myPhoto!.path), fit: BoxFit.fill,)),
              ),
            ),
            TextButton(
              onPressed: (){
                pickImage().then((value) {
                  myPhoto = value;
                  setState(() {
                  });
                });
              },
              child: Text(   myPhoto==null? AppTexts.addphoto:AppTexts.changephoto,style: Theme.of(context).textTheme.bodySmall,),
            ),
            const SizedBox(height: 40,),
            TextFormField(
              controller: nameController,
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
                  border: InputBorder.none,

                  floatingLabelStyle: const TextStyle(
                      color: Colors.black
                  ),
                  hintText: "Enter your name",hintStyle: Theme.of(context).textTheme.bodySmall
              ),
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
                  if(myPhoto==null || nameController.text.isEmpty ){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter your data")));
                  } else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
                      return HomeScreen(photo: File(myPhoto!.path),
                        name: nameController.text,);
                    },));
                  }

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
    );
  }
}
