// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class FavoriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return  ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState ,
        
          builder:(context)=>
         ListView.separated(
          itemBuilder: (context,index)=>buildListProduct(
            ShopCubit.get(context).favoritesModle!.data!.data![index].data,context),
              separatorBuilder: (context,index)=>myDivider() ,
               itemCount: ShopCubit.get(context).favoritesModle!.data!.data!.length),
               fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      });
  }  

 
}