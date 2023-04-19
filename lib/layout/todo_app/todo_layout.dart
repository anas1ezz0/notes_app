// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/components/components.dart';
import 'archived_tasks/archived_tasks_screen.dart';
import 'done_tasks/done_tasks_screen.dart';
import 'new_tasks/new_tasks_screen.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens =
  [
     NewTasksScreen(),
     DoneTasksScreen(),
     ArchivedTasksScreen(),
  ];
  List<String> title =
  [
    'New tasks',
    'Done tasks',
    'Archived tasks',
  ];
    Database ?  database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();
   bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var statusController = TextEditingController();
  
// ignore: non_constant_identifier_names
List<Map> Tasks = [];

 
@override
  void initState() {
     
    super.initState();
    createDatabase();
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
    appBar: AppBar(
        title: Text(
            title[currentIndex]
        ),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
      {
        
        if(isBottomSheetShown)
        {

          if(formKey.currentState!.validate()){insertDatabase(
title:titleController.text ,
time: timeController.text,
date: dateController.text,
status: statusController.text
).then((value)
{  Navigator.pop(context);
  isBottomSheetShown = false;
  setState(() {
    fabIcon = Icons.edit;
  });
} );
    }
    }else
        {

          scaffoldkey.currentState!.showBottomSheet(
                  (context) =>Container(
                    color: Colors.white,
                    
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultFormField(
                            onTap:(){} ,
                            controller: titleController,
                            type: TextInputType.text,
                           
                            label: 'Task Title',
                            prefix: Icons.title,
                            suffix: null, validate: (){},

                          ),
                         const SizedBox(
                           height: 5.0,
                         ),
                          defaultFormField(
                            controller: timeController,
                            type: TextInputType.datetime,

                            onTap: ()
                            {
                              showTimePicker(
                                context: context,
                                  initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text = value!.format(context).toString();
                                print(value.format(context));
                              } );
                            },
                           
                            label: 'Task Time',
                            prefix: Icons.watch_later_outlined,
                            suffix: null, validate:  (){},

                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          defaultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,

                            onTap: ()
                            {
                              showDatePicker(
                                context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime.now(),
                                  lastDate: DateTime.parse('2023-05-03')
                              ).then((value)
                              {

                                dateController.text = DateFormat.yMMMd().format(value!) ;

                              });
                              },
                           
                            label: 'Task Date',
                            prefix: Icons.calendar_today,
                            suffix: null, validate: (){},

                          ),
                        ],
                      ),
                    ),
                  ) ,
                  elevation:20.0 
                  ).closed.then((value) {
                  
  isBottomSheetShown = false;
  setState(() {
    fabIcon = Icons.edit;
  });
                  });
          isBottomSheetShown = true;
          setState(() {
            fabIcon = Icons.add;
          });
        }
        


      },
        child:  Icon(
          fabIcon,
        ),


      ),
      bottomNavigationBar:
      BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: ('Tasks'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: ('Done'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: ('Archive'),
            ),
          ]),
    );
  }

  

  void createDatabase() async
  {
  database = await openDatabase(
 'anas.db',
 version: 9,
  onCreate: (Database db,int version) {
      print('database created');
    database?.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT ,time TEXT ,date TEXT,status TEXT)')
  .then((value) {
  print('table created');
 }).catchError((error) {
  print('Error when Creating Table ${error.toString()}');
   });
  },
 onOpen: (database) {
        getDataFromDatabase(database).then((value) {
          Tasks = value;
        });
        print('database opened');
      },
    );
  }
Future insertDatabase(
      {
     
  required String title,
  required String time,
  required String date,
  required String status,

  })  async
   {
  return database?.transaction((txn)
       {return txn.
        rawInsert(
           'INSERT INTO tasks(`title`,,`time`,`date`) VALUES("$title","$time","$date","new")'
          ).then((value) {
            print('$value inserted successfully');
        }).catchError((error){
          print('Error When Inserting New Record ${error.toString()}');
   });
        }
        );
    }
Future<List<Map>> getDataFromDatabase(database)async{
 return   await database?.rawQuery('SELECT * FROM tasks');
}
} 