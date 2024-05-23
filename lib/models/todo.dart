class Todo{
  String todoName;
  DateTime dateTime;
  bool isDone;

  Todo({required this.todoName,required this.dateTime,this.isDone = false});
}