

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/note_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../task_details/task_details_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.name,required this.photo});
  final String name;
  final File photo;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return notes[index].deleted? Container(): Dismissible(
          background: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete),
            color: Colors.red,
          ),
          key: GlobalKey(),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return TaskDetailsScreen(
                  photo: widget.photo,
                  name: widget.name,
                  title:notes[index].title ,
                  dec: notes[index].des,
                  time:notes[index].time,
                  startDate: notes[index].startDate,
                  endDate: notes[index].endDate,
                  archive: notes[index].archive,
                  index: index,
                );

              },));
            },
            child: ListTile(
                trailing: GestureDetector(
                  onTap: (){
                    setState(() {});
                    notes[index].doneOrNot= !notes[index].doneOrNot;
                    if(notes[index].doneOrNot==true){
                      notes[index!].doneOrNot=true;
                    }else{
                      notes[index!].doneOrNot=false;
                    }
                  },
                  child: Container(padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: notes[index].doneOrNot?AppColor.white: AppColor.appbarcolor,
                        border: Border.all(color:AppColor.appbarcolor)
                    ),
                    child: Text("done",style: TextStyle(color:notes[index].doneOrNot? Colors.black:Colors.black),),
                  ),
                ),
                title:Text(notes[index].title,style: Theme.of(context).textTheme.bodySmall,) ,
                subtitle: Text(notes[index].time,style: TextStyle(color: AppColor.appbarcolor),),
                leading: Icon(Icons.shopping_bag,color: AppColor.appbarcolor,)
            ),
          ),
        );
      },);
  }
}
