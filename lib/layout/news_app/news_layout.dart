// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/layout/news_app/search/search_screan.dart';

import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';


class NewsLayout extends StatelessWidget 
{
  const NewsLayout({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
       listener: ( context, state)
      {},
      builder: ( context, state){
        var cubit  = NewsCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
      actions: [
        IconButton(onPressed: (){
          navigateTo(context, SearchScrean());
        },
         icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            AppCubit.get(context).changeAppMode();
          },
         icon: Icon(Icons.brightness_4_outlined))

      ],
        ),

body:cubit.screens[cubit.currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
      items: cubit.bottomItems,
      )
      );
      } ,
    );
  }
}