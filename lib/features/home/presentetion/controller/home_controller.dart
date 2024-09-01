import 'package:flutter/material.dart';
import 'package:todo/core/models/note_model.dart';
class HomeProvider extends ChangeNotifier{
  List<NoteModel> notes = [];
  String convertDateString ( DateTime date ) {
    return date.toString().split(" ")[0]  ;
  }
  String convertTime(TimeOfDay time ) {
    return  "${time.hour}:${time.minute} ${time.period.name}";
  }
  addNote(
  {
    required String title,
    required String des,
    context
}
      )
  {
    notifyListeners();
    if(time != null && startDate!=null && endDate!=null ){
      notes.add(NoteModel(time: convertTime(time!),
          startDate: convertDateString(startDate!),
          endDate: convertDateString(endDate!),
          title: title, des: des)) ;

      notifyListeners();
      Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill data")));
    }
}

deleteNote(
  {
    required NoteModel noteModel
}
    )
{
 notes.remove(noteModel);
 notifyListeners();
}
updateArchive(int index,
   {
  context
  }
  ){
  notifyListeners();
    notes[index].archive=true;
    Navigator.pop(context);
}
updatedone(int index){
    notes[index].doneOrNot=!notes[index].doneOrNot;
    notifyListeners();
}
  DateTime datTimeNow = DateTime.now();
  DateTime? startDate = DateTime.now();
  DateTime?  endDate = DateTime.now();
  TimeOfDay?  time ;
  selectStartDate(context)async{
    startDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add(const Duration(
      days: 365,
    )),
    );
  }
  selectEndDate(context)async{
    endDate =await  showDatePicker(context: context, firstDate:datTimeNow, lastDate: datTimeNow.add( const Duration(
      days: 365,
    )),
    );
  }
}