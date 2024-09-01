import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/done_tasks/done_details_screen.dart';
import 'package:todo/features/home/presentetion/controller/home_controller.dart';
import '../../core/models/note_model.dart';
import '../../core/utils/app_colors.dart';
class DoneTasksScreen extends StatefulWidget {
   const DoneTasksScreen({super.key, required this.name,required this.photo});
   final String name;
   final File photo;
  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}
class _DoneTasksScreenState extends State<DoneTasksScreen> {

  @override
  Widget build (BuildContext context) {
    List <NoteModel> dones=Provider.of<HomeProvider>(context).notes.where((element) => element.doneOrNot==true).toList();
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff18283A):const Color(0xffF9FEFB),
       title: const Text("Done Tasks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
       centerTitle: true,
     ),
      body: dones.isEmpty? const Center(
          child: Text("Not tasks founded")):
      ListView.builder(
        itemCount: dones.length,
        itemBuilder: (context, index){
          return Provider.of<HomeProvider>(context).notes[index].doneOrNot? GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DoneTasksDetailsScreen(
                    index: index,
                    title: Provider.of<HomeProvider>(context).notes[index].title,
                    dec: Provider.of<HomeProvider>(context).notes[index].des, time: Provider.of<HomeProvider>(context).notes[index].time, startDate: Provider.of<HomeProvider>(context).notes[index].startDate, endDate: Provider.of<HomeProvider>(context).notes[index].endDate, archive: Provider.of<HomeProvider>(context).notes[index].archive, name:widget.name , photo: widget.photo

                );
              },));
            },
            child: ListTile(
                trailing: Column(
                  children: [
                    Text(dones[index].startDate.toString(),style: TextStyle(fontSize: 12,color:Theme.of(context).brightness==Brightness.dark?Colors.white :const Color(0xff24364B),),),
                    Text(dones[index].endDate.toString(),style: TextStyle(fontSize: 12,color: Theme.of(context).brightness==Brightness.dark?Colors.white :const Color(0xff24364B),),),
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