import '../../../../user/shop_app/login_model.dart';

abstract class ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterLoadingState extends ShopRegisterStates{}
class ShopRegisterSuccsessState extends ShopRegisterStates{
  final ShopLoginModel loginModel;

  ShopRegisterSuccsessState(this.loginModel);
}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}

class ShopRegisterChangPasswordVisibilityState extends ShopRegisterStates{}