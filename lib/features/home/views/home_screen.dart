
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/models/note_model.dart';
import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/features/add_tasks/views/add_tasks_screen.dart';
import 'package:todo/features/home/views/drawer_screen.dart';
import 'package:todo/features/task_details/task_details_screen.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,required this.name,required this.photo ,});
  final String name;
  final File photo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30)),
       backgroundColor: AppColor.appbarcolor,
       child: Icon(Icons.add,color: AppColor.white,),
       onPressed: (){

         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return AddTasksScreen(


             name: widget.name,
             photo: widget.photo,
           );
         },));
       },
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

     appBar: AppBar(
       leading: GestureDetector(
         onTap: (){
           Scaffold.of(context).openDrawer();
         },
           child: Image.asset(AppImages.menu)
       ),
       backgroundColor: AppColor.appbarcolor,
       title: Column(
         children: [Text("Hello!"),
           Text(widget.name),
           Text(DateTime.now().toString().split(" ")[0],style: TextStyle( color: AppColor.white),),],
       ),

       toolbarHeight: 150,
       actions: [
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(right: 15),
               child: Container(
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
             ),
           ],
         )
       ],

     ),
     drawer: Drawer(
       child: DrawerScreen(
         photo: widget.photo,
         name: widget.name,
       ),
     ),
     body: notes.isEmpty?
     Center(child: Text(" No Notes please add task")):
       ListView.builder(
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
                   },
                   child: Container(padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: notes[index].doneOrNot? AppColor.appbarcolor:AppColor.white,
                     border: Border.all(color:AppColor.appbarcolor)
                     ),


                     child: Text("done",style: TextStyle(color:notes[index].doneOrNot? AppColor.white:Colors.black),),
                   ),
                 ),
                 title:Text(notes[index].title) ,
                 subtitle: Text(notes[index].time,style: TextStyle(color: AppColor.appbarcolor),),
                 leading: Icon(Icons.shopping_bag,color: AppColor.appbarcolor,)
               ),
             ),
           );
         },),


   );
  }
}
