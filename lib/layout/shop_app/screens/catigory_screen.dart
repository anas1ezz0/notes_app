// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/layout/shop_app/cubit/cubit.dart';
import 'package:app/layout/shop_app/cubit/states.dart';
import 'package:app/models/shop_app/categories_model.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatigoryScreen extends StatelessWidget {
  const CatigoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return  ListView.separated(
        itemBuilder: (context,index)=>buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]), 
      separatorBuilder: (context,index)=>myDivider() ,
       itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length);
      },
    );
  }

  Widget buildCatItem(DataModel modle)=>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children:
       [Image(image:
        NetworkImage(modle.image!),
      height: 100,
      width: 100,
      fit: BoxFit.cover,
      ),
      SizedBox(
        width: 10,
      ),
      Text(modle.name!,
      style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
      ),
      Spacer(),
      Icon(Icons.arrow_forward)
      ],
      
      ),
    );
}