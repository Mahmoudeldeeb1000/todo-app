import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo/core/models/note_model.dart';
import 'package:todo/core/share_widget/costom_botton.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/archive/archive_screen.dart';
import 'package:todo/features/home/views/home_screen.dart';
import 'package:todo/features/task_details/task_details_screen.dart';
import '../../core/utils/app_colors.dart';
class ArchiveDetailsScreen extends StatefulWidget {
  ArchiveDetailsScreen({super.key,required this.index, required this.title, required this.dec, required this.time, required this.startDate, required this.endDate, required this.archive, required this.name,required this.photo,  });
  final String title;
  final String dec;
  final String time;
  final String startDate;
  final String endDate;
  final bool archive;
  int index;
  final String name;
  final File photo;

  @override
  State<ArchiveDetailsScreen> createState() => _ArchiveDetailsScreenState();
}

class _ArchiveDetailsScreenState extends State<ArchiveDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?Color(0xff18283A):Color(0xffF9FEFB),
        title: Text("Task Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: ListView(
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
                          Text("Task Name",style:Theme.of(context).textTheme.bodySmall,),
                          Text(widget.title,style: Theme.of(context).textTheme.bodySmall,)
                        ],
                      ),
                    )
                )
            ),
            SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
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
                          Text(widget.dec,style:Theme.of(context).textTheme.bodySmall,)
                        ],
                      ),
                    )
                )
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color:Theme.of(context).brightness==Brightness.dark?Color(0xff24364B) :Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                    title:Text("Start Date",style: Theme.of(context).textTheme.bodySmall,),
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
                    title:Text("End Date",style: Theme.of(context).textTheme.bodySmall,),
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
                    title:Text("Add Time",style: Theme.of(context).textTheme.bodySmall),
                    subtitle: Text(widget.time,style: TextStyle(color: AppColor.appbarcolor),),
                    leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
                ),
              ),
            ),
            SizedBox(height: 40,),
            CustomButton(
              colors: [
                AppColor.bottom1,
                AppColor.bottom2
              ],
              icon: Icons.archive,
              title: "Unarchive",
              onPressed: (){
                notes[widget.index].archive=false;
                print(notes[widget.index].archive.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen(name: widget.name, photo: widget.photo);
                },));
              },
            ),
            CustomButton(
              icon: Icons.delete,
              colors: [
                Color(0xffBD5461),
                Color(0xffBD5461)
              ],

              title: "Delete",
              onPressed: (){
                notes[widget.index].archive=true;
                showDeleteDialog(context);
              },
            )

          ]
      ),
    );
  }
  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:    Text(AppTexts.areYouSureDeleteTask,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,

                fontSize: 16
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    notes[widget.index].deleted=true;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen(
                          name:widget.name ,
                          photo: widget.photo);
                    },)).then((value) => setState(() {
                      notes[widget.index].deleted=false;
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


