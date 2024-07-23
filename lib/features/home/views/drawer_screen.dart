import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/archive/archive_screen.dart';
import 'package:todo/features/done_tasks/done_tasks_screen.dart';

import '../../../core/utils/app_colors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key, required this.name, required this.photo});
final String name;
final File photo;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(color: AppColor.appbarcolor),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: Image.file(widget.photo,fit: BoxFit.fill,).image,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text(widget.name)
              ],
            )) ,

        SizedBox(height: 18,),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: ListTile(
            onTap: ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (C) {
                return ArchiveScreen(
                  name: widget.name,
                  photo: widget.photo,
                );
              } ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                )
            ),
            tileColor:Color(0xffEFF6F8),
            leading: Icon(Icons.archive),
            title: Text("Archived Tasks",style: TextStyle(color:Color(0xff90B6E2) ),),
          ),
        ),

        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: ListTile(
            onTap: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (C) {
                return DoneTasksScreen(
                  name: widget.name,
                  photo: widget.photo,
                );
              } ))..then((value) => setState(() {

              }));
            },
            tileColor: Color(0xffEFF6F8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                )
            ),
            title: Text("Done Tasks",style: TextStyle(color: Color(0xff90B6E2))),
            leading: Icon(Icons.cloud_done_rounded),
          ),
        ),
      ],
    );
  }
}