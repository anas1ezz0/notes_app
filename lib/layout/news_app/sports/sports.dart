// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';



class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit,NewsStates>(
    
      listener: (context, state) {},
      builder:  (context, state) 
      {
 var list = NewsCubit.get(context).sports;
return articalBuilder(list,context);
      }
      
    );
  }
  }
