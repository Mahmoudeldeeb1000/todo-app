import 'dart:io';

import 'package:flutter/material.dart';
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

      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff18283A):const Color(0xffF9FEFB),
        title: const Text("Task Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                      color: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Task Name",style: Theme.of(context).textTheme.bodySmall),
                          Text(widget.title,style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    )
                )
            ),
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    height: 120,
                    width: double.infinity,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descreption",style: Theme.of(context).textTheme.bodySmall),
                          Text(widget.dec,style:Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    )
                )
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color:Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                    title:const Text("Start Date"),
                    subtitle: Text(widget.startDate,style: TextStyle(color: AppColor.appbarcolor),),
                    leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                    title:const Text("End Date"),
                    subtitle: Text(widget.endDate,style: TextStyle(color: AppColor.appbarcolor),),
                    leading: Icon(Icons.calendar_month_outlined,color: AppColor.appbarcolor,)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color:Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                    title:const Text("Add Time"),
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


