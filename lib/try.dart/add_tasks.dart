// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_data.dart';

class AddTasks extends StatelessWidget {
  final Function addTasksCallback;
   AddTasks(this.addTasksCallback);

  @override
  Widget build(BuildContext context) {
    String? newTasksTitle;
    return Container(
      padding:  EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            
            "Add Tasks" ,
            textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          
          ),
           TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText){
newTasksTitle = newText;
            },
            
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(onPressed:(){
       Provider.of<TaskData>(context , listen: false).addTasks(newTasksTitle!);
       Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.teal[400]
            ), child:Text
              ("Add"),
           )
        ],
      ),
    );
  }
}