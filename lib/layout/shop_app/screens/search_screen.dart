// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:app/modules/search/cubit/cubit.dart';
import 'package:app/modules/search/cubit/state.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ShopSearchScreen extends StatelessWidget {
 
var formKey =  GlobalKey<FormState>();
var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchState>(
listener:(context, state) {}, 
builder: (context, state) {
  return  Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                  controller: searchController,
                   type: TextInputType.name, 
                   validate: (String value){
                    if (value.isEmpty){
                      return ' enter text to search';
                    }
                    return null;
                   },
                   onSubmit: (String text){
                    SearchCubit.get(context).search(text);
                   },
                    label: 'Search',
                     prefix: Icons.search),
                     SizedBox(
                      height: 10,
                     ),
                     if(state is SearchLoadingState)
                     LinearProgressIndicator(),
                      SizedBox(
                      height: 10,
                     ),
                     if(state is SearchSuccessState)
                              Expanded(
                                child: ListView.separated(
                                        itemBuilder: (context,index)=>buildListProduct(SearchCubit.get(context).model!.data!.data![index] ,context , isoldPrice : false),
                                            separatorBuilder: (context,index)=>myDivider() ,
                                             itemCount: SearchCubit.get(context).model!.data!.data!.length),
              ),
              ],
            ),
          ),
         );
       },      
  )
    );
  }
}