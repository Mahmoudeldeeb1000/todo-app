import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/archive/archive_details_screen.dart';

import '../../core/models/note_model.dart';
import '../../core/utils/app_colors.dart';
import '../home/presentetion/controller/home_controller.dart';

class ArchiveScreen extends StatefulWidget {
   const ArchiveScreen({super.key, required this.name,required this.photo,});
   final String name;
   final File photo;

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}
class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    List <NoteModel> archives= Provider.of<HomeProvider>(context).notes.where((element) => element.archive==true).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff18283A):const Color(0xffF9FEFB),
        title: const Text("Archived Tasks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: archives.isEmpty? const Center(
          child: Text("Not tasks founded")): ListView.builder(
        itemCount: archives.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ArchiveDetailsScreen(
                    index: index,
                    title: Provider.of<HomeProvider>(context).notes[index].title,
                    dec: Provider.of<HomeProvider>(context).notes[index].des, time: Provider.of<HomeProvider>(context).notes[index].time, startDate: Provider.of<HomeProvider>(context).notes[index].startDate, endDate: Provider.of<HomeProvider>(context).notes[index].endDate, archive: Provider.of<HomeProvider>(context).notes[index].archive, name:widget.name , photo: widget.photo

                );
              },));
            },
            child: Dismissible(
              background: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.red,
                child: const Icon(Icons.delete),
              ),
              key: GlobalKey(),
              child: Provider.of<HomeProvider>(context,listen: false).notes[index].archive? ListTile(
                  trailing: GestureDetector(
                    onTap: (){
                      setState(() {
                      });
                        Provider.of<HomeProvider>(context,listen: false).notes[index].archive=false;
                    },
                    child: Container(padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:  AppColor.appbarcolor,
                          border: Border.all(color:AppColor.appbarcolor)
                      ),


                      child: Text("Unarchive",style: TextStyle(color:Provider.of<HomeProvider>(context).notes[index].doneOrNot? AppColor.white:Colors.black),),
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
