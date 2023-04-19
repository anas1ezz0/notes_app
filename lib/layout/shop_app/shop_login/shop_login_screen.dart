// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, avoid_print
import 'package:app/layout/shop_app/shop_layout/shop_layout_screan.dart';
import 'package:app/layout/shop_app/shop_login/cubit/cubit.dart';
import 'package:app/layout/shop_app/shop_login/cubit/states.dart';
import 'package:app/layout/shop_app/shop_register/shop_register_screen.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/network/remote/cash_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';


class ShopLogin extends StatelessWidget 
{

  ShopLogin({super.key});

   var formKey =  GlobalKey<FormState>();
var emailController = TextEditingController();
var passwordController = TextEditingController();

  @override

  Widget build(BuildContext context)
   {
var emailController = TextEditingController();
var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: ((context, state) {
          if(state is ShopLoginSuccsessState)
          {
            if(state.loginModel.status!){
              print(state.loginModel.data?.token);
              print(state.loginModel.message);

CashHelper.saveData(key: 'token', value:state.loginModel.data?.token ).then((value){
  token = state.loginModel.data!.token!;
  navigateAndFinsh(context, ShopLayoutScrean());
});
               
            }else{
              print(state.loginModel.message);

             showToast(
              text:state.loginModel.message! ,
              state: ToastStates.error
              ) ;  
             

            }
          }
        }),
        builder: (context, state) {
          return  Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(onPressed: (){
                navigateAndFinsh(context, ShopLayoutScrean());
              }, child: Text('SKIP BRO'))
            ],
          ),
          body: Center(            
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                   key: formKey,
                  child: Column(                  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login' ,
                       style: TextStyle
                       (
                        fontSize: 30 ,
                         fontWeight: FontWeight.bold),),
                         SizedBox(height: 15,),
                         Text('Login to show our offers' ,),
                         SizedBox(height: 25,),                      
                        defaultFormField(controller: emailController, 
                        type: TextInputType.emailAddress,
                         validate: (String value){
                          if(value.isEmpty){
                            return 'Email must not be empty';
                          }
                         },
                          label: 'Email', 
                          prefix: Icons.email),
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
                           
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSubmit: (value){
                             if(formKey.currentState!.validate())
                             {
                                    ShopLoginCubit.get(context).userLogin(
                              email: emailController.text, 
                              password: passwordController.text);
                              }
                              
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: (){
                          ShopLoginCubit.get(context).changPasswordVisibility();
                          }
                          ),
                          
                          SizedBox(height: 15,),
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState ,
                            builder: (context) => defaultButton(function: (){ 
                              if(formKey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                              email: emailController.text, 
                              password: passwordController.text);
                              }
                          
                            },
                             text: 'login', isUpperCase: true),
                            fallback:(context) => Center(child: CircularProgressIndicator()),
                            
                          ),
                          Row(
                            children: [
                              Text(' you don\'t have am email?'),
                              TextButton(onPressed: (){
                                 navigateTo(context, ShopRegisterScreen());
                              }, child: Text('Register here'))
                            ],
                          )
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