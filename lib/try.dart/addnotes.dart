import 'package:app/try.dart/home.dart';
import 'package:app/try.dart/sqldb.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}
class _AddNotesState extends State<AddNotes> {
SqlDb sqlDb = SqlDb();

  GlobalKey<FormState> formstate = GlobalKey();
  
  TextEditingController  note = TextEditingController();
   TextEditingController  title = TextEditingController();
    TextEditingController  color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Addnotes')
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
  //  int response=await sqlDb.insertData(
  //   '''
  //   INSERT INTO notes (`note` , `title` , `color`)
  //   VALUES("${note.text}" , "${title.text}", "${color.text}")
  //    ''');
  int response = await sqlDb.insert("notes",{
     "note": note.text,
   "title":  title.text,
    "color": color.text
  }
   

    );
     if(response > 0){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Home() ), (route) => false);
     }
   
  }, 
  textColor: Colors.white,
  color:Colors.blue,
  child: const Text('Add Note'),)
              ],
            ))
          ]),
        )
        ,
    );
  }
}