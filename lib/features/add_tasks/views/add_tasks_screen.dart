import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo/core/models/note_model.dart';
import 'package:todo/core/share_widget/costom_botton.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/features/home/views/home_screen.dart';

class AddTasksScreen extends StatefulWidget {
  final String name;
  final File photo;

   AddTasksScreen({super.key, required this.name,  required this.photo,});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  TextEditingController nameController  =TextEditingController();

  TextEditingController descController  =TextEditingController();

   DateTime datTimeNow = DateTime.now();

   DateTime? startDate = DateTime.now();

   DateTime?  endDate = DateTime.now();

   TimeOfDay?  time ;
  String convertDateString ( DateTime date ) {
    return date.toString().split(" ")[0]  ;
  }
  String convertTime(TimeOfDay time ) {
    return  "${time.hour}:${time.minute} ${time.period.name}";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7F5),
      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: true,
      ),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: nameController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                labelText: "Task Name",
                floatingLabelStyle: TextStyle(
                    color: Colors.black
                ),
                hintText: "Enter The Task Name",hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff6E6A7C).withOpacity(.5),
            )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: descController,
            minLines: 4,
            maxLines: 5,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                labelText: "Description",
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelStyle: TextStyle(

                    color: Colors.black
                ),
                hintText: "Enter The Task Desciption",
                hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff6E6A7C).withOpacity(.5),
            )
            ),),
        ),

        ListTile(
          tileColor: Colors.white,
          title: Text("Start date"),
          subtitle: Text(

            startDate == null? "Enter The Start Date":
            convertDateString(startDate!),
            style: TextStyle(
                color: Colors.grey
            ),
          ) ,
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down_rounded,size: 50,),
            onPressed: ( ) async{
              startDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add(const Duration(
                days: 365,

              )),
              );
              setState(() {
              });
            } ,
          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 16,),
        ListTile(
          tileColor: Colors.white,
          title: Text("End date"),
          subtitle: Text(

            endDate == null? "Enter The End Date":
            convertDateString(endDate!),
            style: TextStyle(
                color: Colors.grey
            ),
          ) ,
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down_rounded,size: 50,),
              onPressed: ( )  async {
                endDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add( Duration(
                  days: 365,

                )),
                );
                setState(() {


                });
              } ,

          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 16,),
        ListTile(
          tileColor: Colors.white,
          title: Text("Add time "),
          subtitle: Text(
            time == null? "Set A Time For The Task ":
            time!.format(context),
            style: TextStyle(
                color: Colors.grey
            ),
          ) ,
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down_rounded,size: 50,),
            onPressed: ( )  async{
              time  =    await  showTimePicker(context: context, initialTime: TimeOfDay.now());
              setState(() {
              });
            },
          ),
          leading: Icon(Icons.date_range),
        ),
        SizedBox(height: 40,),
        CustomButton(
          colors: [
            AppColor.bottom1,
            AppColor.bottom2
          ],
            title: "Add Task",
          onPressed: (){
              setState((){
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return HomeScreen(
                     name: widget.name,
                     photo: widget.photo);
               },)).then((value) => setState(() {




               }));
               if (startDate==null && endDate==null &&time==null && nameController.text.isEmpty&& descController.text.isEmpty){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("fill data")));
               }else{
                 notes.add(
                     NoteModel(title: nameController.text,
                       des: descController.text,
                       time: time!.format(context).toString(),
                       startDate: convertDateString(startDate!),
                       endDate: convertDateString(endDate!),

                     ));
               }
              });
          },
        ),]
      ),
    );
  }
}
