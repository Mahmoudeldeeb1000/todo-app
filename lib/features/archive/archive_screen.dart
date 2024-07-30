import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/archive/archive_details_screen.dart';
import 'package:todo/features/task_details/task_details_screen.dart';

import '../../core/models/note_model.dart';
import '../../core/utils/app_colors.dart';

class ArchiveScreen extends StatefulWidget {
   ArchiveScreen({super.key, required this.name,required this.photo,});
   final String name;
   final File photo;

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  List <NoteModel> archives= notes.where((element) => element.archive==true).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?Color(0xff18283A):Color(0xffF9FEFB),
        title: Text("Archived Tasks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: archives.isEmpty? Center(
          child: Text("Not tasks founded")): ListView.builder(
        itemCount: archives.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ArchiveDetailsScreen(
                    index: index,
                    title: notes[index].title,
                    dec: notes[index].des, time: notes[index].time, startDate: notes[index].startDate, endDate: notes[index].endDate, archive: notes[index].archive, name:widget.name , photo: widget.photo

                );
              },));
            },
            child: Dismissible(
              background: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete),
                color: Colors.red,
              ),
              key: GlobalKey(),
              child: notes[index].archive? ListTile(
                  trailing: GestureDetector(
                    onTap: (){

                      setState(() {
                        notes[index].archive=false;
                      });
                    },
                    child: Container(padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:  AppColor.appbarcolor,
                          border: Border.all(color:AppColor.appbarcolor)
                      ),


                      child: Text("Unarchive",style: TextStyle(color:notes[index].doneOrNot? AppColor.white:Colors.black),),
                    ),
                  ),
                  title:Text(archives[index].title,style: Theme.of(context).textTheme.bodySmall,) ,
                  subtitle: Text(archives[index].time,style: TextStyle(color: AppColor.appbarcolor),),
                  leading: Icon(Icons.shopping_bag,color: AppColor.appbarcolor,)
              ):
              Container()
            ),
          );
        },),
    ) ;
  }
}
