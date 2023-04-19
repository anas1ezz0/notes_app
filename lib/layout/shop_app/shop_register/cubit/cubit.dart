// ignore_for_file: avoid_print
import 'package:app/layout/shop_app/shop_register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/end_pointes.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../user/shop_app/login_model.dart';



class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
ShopLoginModel? loginModel ;
  void userRegister({
        required String name,
    required String email,
        required String password,
        required String phone,
  }){
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: REGISTER,
    data: {
      'name' :name,
      'email' :email,
      'password':password,
      'phone':phone,
    }
     ).then((value) {
       print(value.data);
    loginModel= ShopLoginModel.fromJson(value.data);
   emit(ShopRegisterSuccsessState(loginModel!));
      
     }).catchError((error)
     {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
     });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;
  void changPasswordVisibility()
  {
    isPassword = !isPassword;
suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
emit(ShopRegisterChangPasswordVisibilityState());
  }
}