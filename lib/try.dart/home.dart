// ignore_for_file: prefer_const_constructors

import 'package:app/try.dart/editnotes.dart';
import 'package:app/try.dart/sqldb.dart';
import 'package:flutter/material.dart';


  class Home extends StatefulWidget{
  const Home({super.key});
   @override
  State<Home>createState() => _HomeState();
  }

  class _HomeState extends State<Home> {

    SqlDb sqlDb = SqlDb();
    bool isLoading = true ;
    List notes =[] ;

Future readData()async{
List<Map> response =  await sqlDb.read("notes");
notes.addAll(response);
isLoading = false ;
if(mounted){
  setState(() {
    
  });
}
}
@override
  void initState() {
    readData();
    super.initState();
  }


    @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('HomePage') ,
         ) ,
       
       floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed('addnotes');
       }, child: const Icon(Icons.add),),
      body:isLoading == true?
      // ignore: avoid_unnecessary_containers
      const Center(child: Text("Loading")):Container (
        child: ListView(
          children: [


             
              ListView.builder(
    itemCount: notes.length,
    physics:  NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (contex , i){
return Card(
  child: ListTile(
  title: Text("${notes[i]['title']}"),
  subtitle: Text("${notes[i]['note']}"),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    IconButton(onPressed: ()async{
// int response = await sqlDb.deleteData("DELETE FROM notes WHERE id = ${notes[i]['id']}");
int response = await sqlDb.delete("notes" , "id = ${notes[i]['id']}" );
if(response >0){
 notes.removeWhere((element) => element['id'] == notes[i]['id']);
 setState(() {
   
 });
}
  },
   icon: const Icon(Icons.delete , color: Colors.red,)),
   IconButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (contex) => EditNotes(
  note:  notes[i]['note'],
  title:  notes[i]['title'],
  color:  notes[i]['color'],
  id:  notes[i]['id'],
)));
   },
icon: const Icon(Icons.edit , color: Colors.blue,)),
  ],) 
   
),);
  }),
             


          ],
        ),
      )
  
  );}
  
  }
 

