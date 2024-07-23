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
class DoneTasksDetailsScreen extends StatefulWidget {
  DoneTasksDetailsScreen({super.key,required this.index, required this.title, required this.dec, required this.time, required this.startDate, required this.endDate, required this.archive, required this.name,required this.photo,  });
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
  State<DoneTasksDetailsScreen> createState() => _DoneTasksDetailsScreenState();
}

class _DoneTasksDetailsScreenState extends State<DoneTasksDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F7F5),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Task Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          Text(widget.title,style: TextStyle(color: Color(0xff8E8E8E)),)
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    height: 120,
                    width: double.infinity,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descreption",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          Text(widget.dec,style: TextStyle(color: Color(0xff8E8E8E)))
                        ],
                      ),
                    )
                )
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  color: Colors.white,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                    title:Text("Add Time"),
                    subtitle: Text(widget.time,style: TextStyle(color: AppColor.appbarcolor),),
                    leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
                ),
              ),
            ),


          ]
      ),
    );
  }

}


