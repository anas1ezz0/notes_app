// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

 final  bool isCheaked;
 final String taskTitle;
 final Function(bool?) checkBoxChange;
  final Function() listtiledelete;

  TaskTile( {required this.isCheaked ,
   required this.taskTitle ,
    required this.checkBoxChange,
    required this.listtiledelete
    });

 @override
  Widget build(BuildContext context) {
    return (
     
    ListTile(
      
       title:  Text(
        taskTitle,
    style: TextStyle(
      decoration: isCheaked ?TextDecoration.lineThrough:null ),
      ),
       trailing:  Checkbox(
    activeColor: Colors.teal[400],
        value:isCheaked ,
         onChanged:checkBoxChange ),
         onLongPress: listtiledelete,
      )
    );
  }
}

