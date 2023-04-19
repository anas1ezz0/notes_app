// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../user/user_model.dart';






class UserScreen extends StatelessWidget {
  List<UserModel> user = [
    UserModel(
      id: 1,
      name: 'Anoos Ezz',
      phone: '01222454788',
    ),
    UserModel(
      id: 2,
      name: 'mama',
      phone: '01223454788',
    ),
    UserModel(
      id: 3,
      name: 'wannos',
      phone: '01122454788',
    ),
    UserModel(
      id: 4,
      name: 'fanoos',
      phone: '01222789788',
    ),
    UserModel(
      id: 5,
      name: 'shatr',
      phone: '01222224788',
    ),
    UserModel(
      id: 6,
      name: 'wannos',
      phone: '01122454788',
    ),
    UserModel(
      id: 7,
      name: 'fanoos',
      phone: '01222789788',
    ),
    UserModel(
      id: 8,
      name: 'shatr',
      phone: '01222224788',
    ),
    UserModel(
      id: 6,
      name: 'wannos',
      phone: '01122454788',
    ),
    UserModel(
      id: 7,
      name: 'fanoos',
      phone: '01222789788',
    ),
    UserModel(
      id: 8,
      name: 'shatr',
      phone: '01222224788',
    ),
  ];

   UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),

      ),
      body: ListView.separated(itemBuilder: (context,index) =>buildUserItem(user[index]),
          separatorBuilder:(context,index) =>Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ) ,
          itemCount:user.length,
      )

    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),
          ) ,
        ),
        SizedBox(
          width: 20.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              user.name,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ) ,
            Text(
              user.phone
              ,style: TextStyle(color: Colors.grey),),
          ],)
      ],
    ),
  );
}
