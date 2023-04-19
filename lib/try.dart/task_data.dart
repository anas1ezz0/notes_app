import 'package:app/try.dart/tasks.dart';
import 'package:flutter/material.dart';


class TaskData extends ChangeNotifier{


  List tasks =[];
  void addTasks (String newTasksTitle){
    tasks.add(Task(name: newTasksTitle));
    notifyListeners();
  }
  void updateTask(Task task){
    task.doneChange();
    notifyListeners();
  }
  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}