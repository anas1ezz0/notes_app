// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';



class LoginScreen extends StatelessWidget {





   var formKey =  GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context)
   {
 var emailController = TextEditingController();
 var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
    body: Padding(
      padding:  EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                 Text(
          
                  "Login", style: TextStyle(fontSize: 30.0, fontWeight:FontWeight.bold ),),
                 SizedBox(
                  height: 20.0,),
          
                defaultFormField
                  (
                  controller: emailController,
                  type: TextInputType.emailAddress ,
                  label: 'Email',
                  prefix: Icons.email,                  
                    suffix: null, validate: (){}      
                ),
            const SizedBox(
                  height: 15.0,),
                defaultFormField
                  (
                  controller: passwordController,
                  type: TextInputType. visiblePassword,
                  label: 'password',
                  prefix: Icons.lock,
                  suffix: null, validate: (){},            
                ),
                const SizedBox(
                  height: 20.0,),
                defaultButton(
                  text: 'login',
                    function:()
                  {
                    if(formKey.currentState!.validate() ) {
                        if (kDebugMode) {
                          print (emailController.text.isEmpty);
                        }
                        if (kDebugMode) {
                          print (passwordController.text.isEmpty);
                        }
                      }
                    }          
                    ),
              const SizedBox(
                height: 10.0,
              ),
                Row(
                  children: [
                    const Text("Don't have an account"),
                    TextButton(onPressed: (){}, child: const Text("Register here"))
                  ],
                )
             ],
            ),
          ),
        ),
      ),
    ),
    );
 }
}

