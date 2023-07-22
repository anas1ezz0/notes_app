// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:app/try.dart/add_tasks.dart';
import 'package:app/try.dart/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';


class TaskScrean extends StatelessWidget {
  bool? ischeaked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        
        splashColor: Colors.green,
          onPressed: (){
          showModalBottomSheet(
          isScrollControlled: true,
            context: context,
           builder:(context)=>SingleChildScrollView(
             child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: AddTasks((newTasksTitle){

              })),
           ),
          );
        },
      backgroundColor: Colors.indigo[400],
      child:  Icon(Icons.add),
      ),
      backgroundColor: Colors.teal,
      body: Container(
      padding:  EdgeInsets.only(
          top: 40,
          bottom: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children:
              [
             Icon(Icons.playlist_add_check ,color: Colors.white,size:20),
              SizedBox(width: 15.0,),
              Text("ToDayDo" , style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)
            ]),
             Text("${Provider.of<TaskData>(context).tasks.length} Tasks", style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
            const SizedBox(height: 15,),
            Expanded(
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20)
                  ),
                ),child:
                 TasksList()
              ),
            ),
          ],
        ),
      ),
    );
   }
 }

