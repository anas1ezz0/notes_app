


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
List posts =[];
Future getposte()async{
String url = "https://jsonplaceholder.typicode.com/posts";
var response = await http.get(
  Uri.parse("https://jsonplaceholder.typicode.com/posts")
    );
 
var responsebody = jsonDecode(response.body);
  setState(() {
    posts.addAll(responsebody);
  });
  if (kDebugMode) {
    print(posts);
  }
    return url;
}
@override
  void initState() {
   getposte();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Api"),
      ),
      body:posts.isEmpty?
      const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context , i){
      return Container(
        margin: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
        child: Text("${posts[i]['title']}"));
    })
    );
  }
}