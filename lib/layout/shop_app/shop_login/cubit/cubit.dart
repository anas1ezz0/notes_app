// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/end_pointes.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../user/shop_app/login_model.dart';
import 'states.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState());
  
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
ShopLoginModel? loginModel ;
  void userLogin({
    required String email,
        required String password,
  }){
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN,
    data: {
      'email' :email,
      'password':password,
    }
     ).then((value) {
       print(value.data);
    loginModel= ShopLoginModel.fromJson(value.data);
   emit(ShopLoginSuccsessState(loginModel!));
      
     }).catchError((error)
     {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
     });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;
  void changPasswordVisibility()
  {
    isPassword = !isPassword;
suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
emit(ShopChangPasswordVisibilityState());
  }
}