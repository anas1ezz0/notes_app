// ignore_for_file: use_key_in_widget_constructors

import 'package:app/try.dart/task_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder:(context , taskData , child){
return ListView.builder(
        itemCount:taskData.tasks.length,
        itemBuilder:(context , i){
          return
    TaskTile(
      isCheaked:  taskData.tasks[i].isDone,
      taskTitle: taskData.tasks[i].name,
      checkBoxChange:(newValue){
    taskData.updateTask(taskData.tasks[i]);
          }, listtiledelete: () { 
taskData.deleteTask(taskData.tasks[i]);
           },
    );
        } 
        
)  ;  
    
      }

    
    
    
   
  );}
}

