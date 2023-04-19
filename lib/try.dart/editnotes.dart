// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app/try.dart/home.dart';
import 'package:app/try.dart/sqldb.dart';
import 'package:flutter/material.dart';

class EditNotes extends StatefulWidget {
  final note ;
  final title ;
  final id ;
  final color;
  const EditNotes({super.key, this.note, this.title, this.id, this.color});

  @override
  State<EditNotes> createState() => _EditNotesState();
}
class _EditNotesState extends State<EditNotes> {
SqlDb sqlDb = SqlDb();

  GlobalKey<FormState> formstate = GlobalKey();
  
  TextEditingController  note = TextEditingController();
   TextEditingController  title = TextEditingController();
    TextEditingController  color = TextEditingController();

    @override
  void initState() {
   note.text = widget.note ;
   title.text = widget.title ;
   color.text = widget.color ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('EditNotesnotes')
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
            Form(
              key: formstate,
              child: Column(
              children: [
TextFormField(
  controller: note,
  decoration: const InputDecoration(
    hintText: "note"
  ),
),
TextFormField(
  controller: title,
  decoration:const InputDecoration(
    hintText: "title"
  ),
),
TextFormField(
  controller: color,
  decoration:const InputDecoration(
    hintText: "color"
  ),
),

Container(height: 20.0),

MaterialButton(
  
  onPressed: ()async{
  //  int response=await sqlDb.updateData('''
  //   UPDATE notes SET 
  //   note = "${note.text}",
  //   title = "${title.text}",
  //   color= "${color.text}"
  //   WHERE id = ${widget.id}
  //    ''');
  int response = await sqlDb.update("notes" , {
"note" :note.text,
"title" :title.text,
"color" :color.text
} ,
   "id =  ${widget.id}");
     if(response > 0){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Home() ), (route) => false);
     }
   
  }, 
  textColor: Colors.white,
  color:Colors.blue,
  child: const Text('EditNotes Note'),)
              ],
            ))
          ]),
        )
        ,
    );
  }
}