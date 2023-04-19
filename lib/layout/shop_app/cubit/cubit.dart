// ignore_for_file: prefer_const_constructors
import 'package:app/layout/shop_app/cubit/states.dart';
import 'package:app/models/shop_app/categories_model.dart';
import 'package:app/models/shop_app/favorites_modeltwo.dart';

import 'package:app/models/shop_app/home_model.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_app/favorites_modle.dart';
import '../../../shared/network/end_pointes.dart';
import '../../../user/shop_app/login_model.dart';
import '../screens/catigory_screen.dart';
import '../screens/favorit_screen.dart';
import '../screens/product_screen.dart';
import '../../../modules/search/settings_screen.dart';

class ShopCubit extends Cubit<ShopState>
{
 ShopCubit() :super(ShopIntialState());
    static ShopCubit get(context) => BlocProvider.of(context);
    int currentIndex = 0;
List<Widget>bottomsScreen = [
 ProductsScreen(),
FavoriteScreen(),
CatigoryScreen(),
SettingsScreen(),
  
];
void changeBottom(int index) {
   currentIndex = index;
   emit(ShopChangeButtomNavState());
   }

  //  home modlee
   HomeModel? homeModel;
   Map<int, bool> favorites={};
   void getHomeData()
   {
    emit(ShopLoadingState());
DioHelper.getData(
  url: HOME,
  token: token,
 
   ).then((value){
  homeModel = HomeModel.fromJson(value.data);
  // if (kDebugMode) {
  //   // printFullText(homeModel!.data!.banners[0].image!);
  //   // print(homeModel?.status);
  // }

  // ignore: avoid_function_literals_in_foreach_calls
  homeModel!.data!.products.forEach((element) {
    favorites.addAll({
      element.id!:element.inFavorite!,
    });
  });
  emit(ShopSuccessState());

}).catchError((error){
  if (kDebugMode) {
    print(error.toString());
  }
  emit(ShopErrorState());
});

   }

// caategori
 CategoriesModel?categoriesModel ;
 void getCategories()
 {
   DioHelper.getData(
     url: GET_CATEGORIES,
     token: token,

   ).then((value){
     categoriesModel = CategoriesModel.fromJson(value.data);

     emit(ShopSuccessCategoriesState());

   }).catchError((error){
     if (kDebugMode) {
       print(error.toString());
     }
     emit(ShopErrorCategoriesState());
   });

 }

// Change fffav
 ChangeFavoritesModel? changeFavoritesModel;
 void changeFavorites(int productId)
 {
favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

  DioHelper.postData(
    url: FAVORITES,
   data: {
    'product_id': productId,
   },
    token:token,
   ).then((value) {
    changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
    if (kDebugMode) {
      print(value.data);
    }
    if(!changeFavoritesModel!.status!){
      favorites[productId] = !favorites[productId]!;
    }else{
      getFavorites();
    }
    emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
   }).catchError((error){
          favorites[productId] = !favorites[productId]!;
    emit(ShopErrorChangeFavoritesate());
   });
 }

// Faaaavv
 FavoritesModle?favoritesModle ;
 void getFavorites()
 {
  emit(ShopLoadingUserUpdateState());
   DioHelper.getData(
     url: FAVORITES,
     token: token,

   ).then((value){
     favoritesModle = FavoritesModle.fromJson(value.data);

     emit(ShopSuccessState());
   }).catchError((error){
     if (kDebugMode) {
       print(error.toString());
     }
     emit(ShopErrorGetFavoritesate());
   });

 }
// LLLOgin
// 
// 
  ShopLoginModel?userModel ;
 void getUserData()
 {
  emit(ShopLoadingUserUpdateState());
   DioHelper.getData(
     url: PROFILE,
     token: token,

   ).then((value){
     userModel = ShopLoginModel.fromJson(value.data);

     emit(ShopSuccessUserUpdateState(userModel!));
   }).catchError((error){
     if (kDebugMode) {
       print(error.toString());
     }
     emit(ShopErrorUserUpdateState());
   });

 }

// updaaate
void updateUserData({
  required String name,
  required String email,
  required String phone,
})
 {
  emit(ShopLoadingUserUpdateState());
   DioHelper.putData(
     url: UPDATE_PROFILE,
     token: token,
      data: {
        'name' :name,
        'email' : email,
        'phone' : phone,
      },

   ).then((value){
     userModel = ShopLoginModel.fromJson(value.data);

     emit(ShopSuccessUserUpdateState(userModel!));
   }).catchError((error){
     if (kDebugMode) {
       print(error.toString());
     }
     emit(ShopErrorUserUpdateState());
   });

 }




}


