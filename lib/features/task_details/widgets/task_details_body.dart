import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/home/presentetion/controller/home_controller.dart';
import 'package:todo/features/home/presentetion/views/home_screen.dart';
import '../../../core/models/note_model.dart';
import '../../../core/share_widget/costom_botton.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_texts.dart';
import '../../archive/archive_screen.dart';
class TaskDetailsScreenBody extends StatefulWidget {
   TaskDetailsScreenBody({super.key, required this.title, required this.dec, required this.time, required this.startDate, required this.endDate, required this.archive, required this.name,required this.photo, required this.noteModel,});
  final String title;
  final String dec;
  final String time;
  final String startDate;
  final String endDate;
  final bool archive;
  int? index;
  final String name;
  final File photo;
  final NoteModel noteModel;

  @override
  State<TaskDetailsScreenBody> createState() => _TaskDetailsScreenBodyState();
}
class _TaskDetailsScreenBodyState extends State<TaskDetailsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child:
              Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color:Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Task Name",style:  Theme.of(context).textTheme.bodySmall,),
                        Text(widget.title,style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                  )
              )
          ),

          Padding(
              padding: const EdgeInsets.all(15.0),
              child:
              Container(
                  decoration: BoxDecoration(
                    color:  Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 120,
                  width: double.infinity,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Descreption",style: Theme.of(context).textTheme.bodySmall,),
                        Text(widget.dec,style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                  )
              )
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                  title:Text("Start Date"),
                  subtitle: Text(widget.startDate,style: TextStyle(color: AppColor.appbarcolor),),
                  leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color:Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                  title:Text("End Date"),
                  subtitle: Text(widget.endDate,style: TextStyle(color: AppColor.appbarcolor),),
                  leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color:Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                  title:Text("Add Time"),
                  subtitle: Text(widget.time,style: TextStyle(color: AppColor.appbarcolor),),
                  leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
              ),
            ),
          ),
          SizedBox(height: 15,),
          CustomButton(
            colors: [
              AppColor.bottom1,
              AppColor.bottom2
            ],
            icon: Icons.archive,
            onPressed: (){
              Provider.of<HomeProvider>(context,listen: false).updateArchive(Provider.of<HomeProvider>(context,listen: false).notes.indexOf(widget.noteModel));
              },
            title: 'Archive',
          ),
          CustomButton(
            icon: Icons.delete,
            colors: [
              Color(0xffBD5461),
              Color(0xffBD5461)
            ],
            title: "Delete",
            onPressed: (){
              Provider.of<HomeProvider>(context).notes[widget.index!].deleted=true;
              showDeleteDialog(context);
            },
          )
        ]
    );
  }
  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:    Text(AppTexts.areYouSureDeleteTask,
            style:Theme.of(context).textTheme.bodySmall,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Provider.of<HomeProvider>(context).notes[widget.index!].deleted=true;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen(
                          name:widget.name ,
                          photo: widget.photo);
                    },)).then((value) => setState(() {
                      Provider.of<HomeProvider>(context).notes[widget.index!].deleted=false;
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffBD5461),
                    ),
                    child:  Text(AppTexts.yesText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "LexendDeca",
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color:  AppColor.appbarcolor,
                    ),
                    child:   Text(
                      AppTexts.noText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,

                        color:AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
