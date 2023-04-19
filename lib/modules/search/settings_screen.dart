// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:app/layout/shop_app/cubit/cubit.dart';
import 'package:app/layout/shop_app/cubit/states.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
 
var formKey =  GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {},
      builder: (context, state)
       {
var model = ShopCubit.get(context).userModel;
nameController.text = model!.data!.name??'';
emailController.text=  model.data!.email??'';
phoneController.text =  model.data!.phone??'';
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel!=null ,
          builder: (context) =>  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                if(state is ShopLoadingUserUpdateState)
                LinearProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: nameController,
                 type: TextInputType.name,
                  validate: (String value){
                    if(value.isEmpty){
                      return ' name must mot be empty';
                    }
                
                  }, 
                  label: 'Name',
                   prefix: Icons.person),
                   SizedBox(
                    height: 20,
                   ),
                           defaultFormField(
                  controller: emailController,
                 type: TextInputType.emailAddress,
                  validate: (String value){
                    if(value.isEmpty){
                      return ' email must mot be empty';
                    }
                
                  }, 
                  label: 'EMail',
                   prefix: Icons.email),
                    SizedBox(
                    height: 20,
                   ),
                    defaultFormField(
                  controller: phoneController,
                 type: TextInputType.phone,
                  validate: (String value){
                    if(value.isEmpty){
                      return ' phone must mot be empty';
                    }
                
                  }, 
                  label: 'Phone',
                   prefix: Icons.phone),
                   
                  SizedBox(
                    height: 20,
                   ),
                     defaultButton(function: (){
                      if(formKey.currentState!.validate()){
                  ShopCubit.get(context).updateUserData(
                    name: nameController.text,
                    email: emailController.text,
                     phone: phoneController.text
                     );
                      }
                
                   }, text: 'Update'),
          
                  SizedBox(
                    height: 20,
                   ),
                   defaultButton(function: (){
                    signOut(context);
                   }, text: 'Logout')
              ],
            ),
          ),
              ) ,
        fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
     
    );
  }
}