

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/home/presentetion/controller/home_controller.dart';

import '../../../core/utils/app_colors.dart';
import '../../task_details/task_details_screen.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.name,required this.photo,});
  final String name;
  final File photo;
  @override
  State<HomeBody> createState() => _HomeBodyState();
}
class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<HomeProvider>(context).notes.length,
      itemBuilder: (context, index) {
        return Provider.of<HomeProvider>(context).notes[index].deleted? Container(): Dismissible(
          background: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          key: GlobalKey(),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return TaskDetailsScreen(
                  noteModel:Provider.of<HomeProvider>(context).notes[index] ,
                  photo: widget.photo,
                  name: widget.name,
                  title:Provider.of<HomeProvider>(context).notes[index].title ,
                  dec: Provider.of<HomeProvider>(context).notes[index].des,
                  time:Provider.of<HomeProvider>(context).notes[index].time,
                  startDate: Provider.of<HomeProvider>(context).notes[index].startDate,
                  endDate: Provider.of<HomeProvider>(context).notes[index].endDate,
                  archive: Provider.of<HomeProvider>(context).notes[index].archive,
                  index: index,
                );
              },));
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color:Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white)),
              child: ListTile(
                  trailing: GestureDetector(
                    onTap: (){
                      Provider.of<HomeProvider>(context,listen: false).updatedone(index);
                    },
                    child: Container(padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Provider.of<HomeProvider>(context).notes[index].doneOrNot?AppColor.white: AppColor.appbarcolor,
                          border: Border.all(color:AppColor.appbarcolor)
                      ),
                      child: Text("done",style: TextStyle(color:Provider.of<HomeProvider>(context).notes[index].doneOrNot? Colors.black:Colors.black),),
                    ),
                  ),
                  title:Text(Provider.of<HomeProvider>(context).notes[index].title,style: Theme.of(context).textTheme.bodySmall,) ,
                  subtitle: Text(Provider.of<HomeProvider>(context).notes[index].time,style: TextStyle(color: AppColor.appbarcolor),),
                  leading: Icon(Icons.shopping_bag,color: AppColor.appbarcolor,)
              ),
            ),
          ),
        );
      },
    );
  }
}
