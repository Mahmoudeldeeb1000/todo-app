import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/done_tasks/done_details_screen.dart';
import '../../core/models/note_model.dart';
import '../../core/utils/app_colors.dart';
class DoneTasksScreen extends StatefulWidget {
   DoneTasksScreen({super.key, required this.name,required this.photo});
   final String name;
   final File photo;
  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}
class _DoneTasksScreenState extends State<DoneTasksScreen> {
  List <NoteModel> dones= notes.where((element) => element.doneOrNot==true).toList();
  @override
  Widget build (BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).brightness==Brightness.dark?Color(0xff18283A):Color(0xffF9FEFB),
       title: Text("Done Tasks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
       centerTitle: true,
     ),
      body: dones.isEmpty? Center(
          child: Text("Not tasks founded")):
      ListView.builder(
        itemCount: dones.length,
        itemBuilder: (context, index){
          return notes[index].doneOrNot? GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DoneTasksDetailsScreen(
                    index: index,
                    title: notes[index].title,
                    dec: notes[index].des, time: notes[index].time, startDate: notes[index].startDate, endDate: notes[index].endDate, archive: notes[index].archive, name:widget.name , photo: widget.photo

                );
              },));
            },
            child: ListTile(
                trailing: Column(
                  children: [
                    Text(dones[index].startDate.toString(),style: TextStyle(fontSize: 12,color:Theme.of(context).brightness==Brightness.dark?Colors.white :Color(0xff24364B),),),
                    Text(dones[index].endDate.toString(),style: TextStyle(fontSize: 12,color: Theme.of(context).brightness==Brightness.dark?Colors.white :Color(0xff24364B),),),
                  ],
                ),
                title:Text(dones[index].title,) ,
                subtitle: Text(dones[index].time,style: TextStyle(color: AppColor.appbarcolor),),
                leading: Icon(Icons.shopping_bag,color: AppColor.appbarcolor,),
            ),
          ):
          Container();
        },),
    ) ;
  }
}