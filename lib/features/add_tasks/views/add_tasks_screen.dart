import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/share_widget/costom_botton.dart';
import 'package:todo/core/utils/app_colors.dart';

import '../../home/presentetion/controller/home_controller.dart';


class AddTasksScreen extends StatefulWidget {
  final String name;
  final File photo;
   const AddTasksScreen({super.key, required this.name,  required this.photo,});
  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}
class _AddTasksScreenState extends State<AddTasksScreen> {
  TextEditingController nameController  =TextEditingController();

  TextEditingController descController  =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff18283A):const Color(0xffF9FEFB),


        title: Text("Add Task",


        style: TextStyle(
         color:    Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black
        ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: nameController,
            style: TextStyle(color: Theme.of(context).brightness==Brightness.dark?Colors.white :const Color(0xff24364B),),
            decoration: InputDecoration(
              fillColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color:Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B):Colors.white)),
                border:InputBorder.none,
                labelText: "Task Name",
                floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
                hintText: "Enter The Task Name",hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color(0xff6E6A7C).withOpacity(.5),
            )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: descController,
            style: TextStyle(color:  Theme.of(context).brightness==Brightness.dark?Colors.white :const Color(0xff24364B),),
            minLines: 4,
            maxLines: 5,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B):Colors.white)),
                border: InputBorder.none,
                labelText: "Description",
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
                hintText: "Enter The Task Desciption",
                hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color(0xff6E6A7C).withOpacity(.5),
            )
            ),),
        ),
        ListTile(

          tileColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
          title: Text("Start date",style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text(
            Provider.of<HomeProvider>(context).startDate == null? "Enter The Start Date":
            Provider.of<HomeProvider>(context).convertDateString(Provider.of<HomeProvider>(context).startDate!),
            style: const TextStyle(
                color: Colors.grey
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down_rounded,size: 50,),
            onPressed: ( ){
             Provider.of<HomeProvider>(context,listen: false).selectStartDate(context);
            },
          ),
          leading: const Icon(Icons.date_range),
        ),
        const SizedBox(height: 16,),
        ListTile(
          tileColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
          title: Text("End date",style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text(
            Provider.of<HomeProvider>(context,).endDate == null? "Enter The End Date":
            Provider.of<HomeProvider>(context).convertDateString(Provider.of<HomeProvider>(context).endDate !),
            style: const TextStyle(
                color: Colors.grey
            ),
          ) ,
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down_rounded,size: 50,),
              onPressed: ( )   {
                Provider.of<HomeProvider>(context,listen: false).selectEndDate(context);
              } ,
          ),
          leading: const Icon(Icons.date_range),
        ),
        const SizedBox(height: 16,),
        ListTile(
          tileColor: Theme.of(context).brightness==Brightness.dark?const Color(0xff24364B) :Colors.white,
          title: Text("Add time ",style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text(
            Provider.of<HomeProvider>(context,listen: false).time == null? "Set A Time For The Task ":
            Provider.of<HomeProvider>(context,listen: false).time!.format(context),
            style: const TextStyle(
                color: Colors.grey
            ),
          ) ,
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down_rounded,size: 50,),
            onPressed: ( )  async{
              Provider.of<HomeProvider>(context,listen: false).time  =    await  showTimePicker(context: context, initialTime: TimeOfDay.now());
              setState(() {
              });
            },
          ),
          leading: const Icon(Icons.date_range),
        ),
        const SizedBox(height: 40,),
        CustomButton(
          colors: [
            AppColor.appbarcolor,
            AppColor.appbarcolor
          ],
            title: "Add Task",
          onPressed: (){
                Provider.of<HomeProvider>(context, listen: false).addNote(
                    des: descController.text ,
                    title: nameController.text,
                    context: context
                );
          },
        ),]
      ),
    );
  }
}
