// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';



class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    
      listener: (context, state) {},
      builder:  (context, state) 
      {
 var list = NewsCubit.get(context).science;
return articalBuilder(list,context);
      }
      
    );
  }
  }
