class NoteModel{
  final String title;
  final String des;
  final String time;
  final String startDate;
  final String endDate;
  bool archive =false;
  bool doneOrNot=false;
  bool deleted = false;

  NoteModel({
    required this.title,
    required this.des,
    required this.time,
    required this.startDate,
    required this.endDate,

  });
}






