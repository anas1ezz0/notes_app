class Task{
 String name = "tasks";
  bool isDone;
  Task({ required this.name ,this.isDone =false});
  void doneChange(){

isDone =!isDone;
}
}
