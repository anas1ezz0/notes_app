// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:app/layout/shop_app/shop_register/cubit/cubit.dart';
import 'package:app/layout/shop_app/shop_register/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/remote/cash_helper.dart';
import '../shop_layout/shop_layout_screan.dart';



class ShopRegisterScreen extends StatelessWidget {
  
var formKey =  GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener:(context, state) {
                    if(state is ShopRegisterSuccsessState)
          { 
            if(state.loginModel.status!){
              if (kDebugMode) {
                print(state.loginModel.data?.token);
              }
              if (kDebugMode) {
                print(state.loginModel.message);
              }

CashHelper.saveData(key: 'token', value:state.loginModel.data?.token ).then((value){
  token = state.loginModel.data!.token!;
  navigateAndFinsh(context, ShopLayoutScrean());
});
               
            }else{
              if (kDebugMode) {
                print(state.loginModel.message);
              }

             showToast(
              text:state.loginModel.message! ,
              state: ToastStates.error
              ) ;  
             

            }
          }
        },
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            
          ),
          body:  Center(            
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                       key: formKey,
                      child: Column(                  
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('REGISTER' ,
                           style: TextStyle
                           (
                            fontSize: 30 ,
                             fontWeight: FontWeight.bold),),
                             SizedBox(height: 15,),
                             Text('Register to show our offers' ,),
                             SizedBox(height: 25,),                      
                            defaultFormField(controller: nameController, 
                            type: TextInputType.name,
                             validate: (String value){
                              if(value.isEmpty){
                                return 'name must not be empty';
                              }
                             },
                              label: 'user name', 
                              prefix: Icons.person),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(controller: emailController, 
                            type: TextInputType.emailAddress,
                             validate: (String value){
                              if(value.isEmpty){
                                return 'email must not be empty';
                              }
                             },
                              label: 'Email', 
                              prefix: Icons.email_outlined),
                              SizedBox(height: 15,),
                                       defaultFormField(
                            controller: passwordController, 
                            type: TextInputType.visiblePassword,
                             validate: (String value){
                              if(value.isEmpty){
                                return 'password must not be empty';
                              }
                             },
                              label: 'password', 
                              prefix: Icons.lock_outline,
                               
                              suffix: ShopRegisterCubit.get(context).suffix,
                              onSubmit: (value){


                              },
                              isPassword: ShopRegisterCubit.get(context).isPassword,
                              suffixPressed: (){
                              ShopRegisterCubit.get(context).changPasswordVisibility();
                              }
                              ),
                              SizedBox(height: 15,),
                              defaultFormField(controller: phoneController, 
                            type: TextInputType.phone,
                             validate: (String value){
                              if(value.isEmpty){
                                return 'phne must not be empty';
                              }
                             },
                              label: 'phone', 
                              prefix: Icons.phone),
                              
                              SizedBox(height: 15,),
                              ConditionalBuilder(
                                condition: state is! ShopRegisterLoadingState ,
                                builder: (context) => defaultButton(function: (){ 
                                  if(formKey.currentState!.validate()){
                                        ShopRegisterCubit.get(context).userRegister(
                                  email: emailController.text, 
                                  password: passwordController.text,
                                   name: nameController.text,
                                    phone: passwordController.text,);
                                  }
                              
                                },
                                 text: 'login', isUpperCase: true),
                                fallback:(context) => Center(child: CircularProgressIndicator()),
                                
                              ),
                           
                        ],),
                    ),
                  ),
                ),
              )
        );
        },
      
      ),
    );
  }
}