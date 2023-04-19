// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:app/layout/news_app/cubit/states.dart';

import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/business.dart';
import '../science/science.dart';
import '../sports/sports.dart';


class NewsCubit extends Cubit<NewsStates>
{
NewsCubit() :super( NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);

int currentIndex = 0;
List<BottomNavigationBarItem> bottomItems=[
  BottomNavigationBarItem(
  icon: Icon(Icons.business),
  label: 'Business' 
),  
  BottomNavigationBarItem(
  icon: Icon(Icons.sports),
  label: 'sports' 
),
BottomNavigationBarItem(
  icon: Icon(Icons.science),
  label: 'Siecnce' 
),
 
];
List<Widget>screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
];

 void changeBottomNavBar(int index){
  currentIndex = index;
  if(index == 1) {
    getSports();
  }
  if(index == 2) {
    getScience();
  }

  emit(NewsBottomNavState());
 }
 List<dynamic>business=[];
void getBusiness()
{
  emit(NewsGetBusinessLoadingState());
DioHelper.getData(
   url:'v2/top-headlines',
           query: {
            'country':'us',
            'category':'business',
            'apiKey':'e8bf3ec647764b12bbd0ea0c083fd596',
      //        'sources':'bbc-news',
      //       'country': 'us',
      // 'category': 'business',
      //      'apikey':'e8bf3ec647764b12bbd0ea0c083fd596',
           },
    
           ).then((value) {
            business = value.data['articles'];
            print(business[0]['title']);

            emit(NewsGetBusinessSuccessState());
           }).catchError((error){
             print(error.toString());
            emit(NewsGetBusinessErrorState(error.toString()));

           });
}
List<dynamic> sports = [];
void getSports()
{
  emit(NewsGetSportsLoadingState());

  if(sports.isEmpty)
  {
DioHelper.getData(
          url:'v2/top-headlines',
           query: {
            'country':'us',
            'category':'sports',
            'apiKey':'e8bf3ec647764b12bbd0ea0c083fd596',
           },
           ).then((value) {
            sports = value.data['articles'];
            print(sports[0]['title']);

            emit(NewsGetSportsSuccessState());
           }).catchError((error){
             print(error.toString());
            emit(NewsGetSportsErrorState(error.toString()));

           });
  }else
  {
emit(NewsGetSportsSuccessState());
  }

}
List <dynamic>science= [];
void getScience()
{
  emit(NewsGetScienceLoadingState());
  if(science.isEmpty)
  {
DioHelper.getData(
          url:'v2/top-headlines',
           query: {
            'country':'us',
            'category':'science',
            'apiKey':'e8bf3ec647764b12bbd0ea0c083fd596',
           
           },
           ).then((value) {
            science = value.data['articles'];
            print(science[0]['title']);

            emit(NewsGetScienceSuccessState());
           }).catchError((error){
             print(error.toString());
            emit(NewsGetScienceErrorState(error.toString()));

           });
  }else
  {
     emit(NewsGetScienceSuccessState());
  }}
List <dynamic>search= [];
void getSearch(String value)
{
  emit(NewsGetScienceLoadingState());
  search = [];
  DioHelper.getData(
    url:'v2/everything',
    query: {
      'q':value,
      'apiKey':'e8bf3ec647764b12bbd0ea0c083fd596',

    },
  ).then((value) {
    search = value.data['articles'];
    print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetSearchErrorState(error.toString()));

  });
}




}