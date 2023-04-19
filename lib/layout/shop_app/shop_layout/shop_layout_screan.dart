// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/layout/shop_app/cubit/cubit.dart';
import 'package:app/layout/shop_app/cubit/states.dart';
import 'package:app/layout/shop_app/screens/search_screen.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopLayoutScrean extends StatelessWidget {
  const ShopLayoutScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state)  {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return  Scaffold(
        appBar: AppBar(
          title: Text('Sala'),
          actions: [
            IconButton(onPressed: (){
              navigateTo(context, ShopSearchScreen());
            }, icon: Icon(Icons.search))
          ],         
        ),
         body: cubit.bottomsScreen[cubit.currentIndex],
         
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            cubit.changeBottom(index);
          },
          currentIndex: cubit.currentIndex,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite'
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'catigory'
          ),  BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings'
          ),
        ]),
       
       
      );
      },
    );
  }
}