// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:app/layout/news_app/cubit/cubit.dart';
import 'package:app/layout/news_app/cubit/states.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchScrean extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: ( context,  state){} ,
      builder: ( context, state){
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(controller:searchController ,
                      type: TextInputType.text,
                      onChange: (value)
                      {
                    NewsCubit.get(context).getSearch(value);
                      },
                      label: 'search',
                      prefix: Icons.search,
                      suffix:null,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'search must not be empty';
                        }
                        return null;
                      }
                  ),
                ),
                Expanded(child: articalBuilder(list, context ,isSearch: true)),
              ]),
        );
      } ,


    );
  }
}