// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, 

import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context)
   {
  
    return BlocConsumer<NewsCubit,NewsStates>(
    
      listener: (context, state) {},
      builder:  (context, state) 
      {
 var list = NewsCubit.get(context).business;
return  articalBuilder(list,context);
      }
      
    );
  }
}