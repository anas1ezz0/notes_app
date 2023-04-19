import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

static Database?_db ;
Future<Database?> get db async{
if(_db == null){
_db = await intialDb();
return _db ;
}else{
  return _db;
}
}


intialDb()async{
String databasepath = await getDatabasesPath();
String path = join(databasepath,'Anasezz.db');
Database mydb = await openDatabase(path, onCreate: _onCreate ,version: 4 , onUpgrade: _onUpgrade);
return mydb;
}

_onUpgrade(Database db , int oldversion, int newversion)async{

if (kDebugMode) {
  print('onupgrade ====================');
}

}

_onCreate(Database db , int version)async{
  Batch batch = db.batch();
 batch.execute('''
CREATE TABLE "notes"(
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" TEXT NOT NULL,
  "note" TEXT NOT NULL,
  "color" TEXT NOT NULL
  )
''');
await batch.commit();
if (kDebugMode) {
  print('creat database and table =====================');
}
}
read(String table)async{
  Database? mydb = await db;
  List<Map> response = await mydb!.query(table);
return response;
}
insert(String table, Map<String, Object?> values )async{
  Database? mydb = await db;
  int response = await mydb!.insert(table , values);
return response;
}
update(String table ,Map<String, Object?> values,mywhere)  async{
  Database? mydb = await db;
  int response = await mydb!.update(table,values , where: mywhere);
return response;
}
delete(String table,String? mywhere,)async{
  Database? mydb = await db;
  int response = await mydb!.delete(table, where: mywhere);
return response;
}


}