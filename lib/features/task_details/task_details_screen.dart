import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo/core/models/note_model.dart';
import 'package:todo/core/share_widget/costom_botton.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/archive/archive_screen.dart';
import 'package:todo/features/home/views/home_screen.dart';
import 'package:todo/features/task_details/widgets/task_details_body.dart';
import '../../core/utils/app_colors.dart';
class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({super.key, this.index, required this.title, required this.dec, required this.time, required this.startDate, required this.endDate, required this.archive, required this.name,required this.photo, });
  final String title;
  final String dec;
  final String time;
final String startDate;
final String endDate;
final bool archive;
int? index;
  final String name;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?Color(0xff18283A):Color(0xffF9FEFB),
        title: Text("Task Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: TaskDetailsScreenBody(
        name:name,
        photo: photo,
        archive: archive,
        title: title,
        dec: dec,
        endDate: endDate,
        startDate: startDate,
        time: time,
      )
    );
  }
}