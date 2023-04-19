import 'package:app/user/shop_app/login_model.dart';

import '../../../models/shop_app/favorites_modle.dart';

abstract class ShopState{}
class ShopIntialState extends ShopState{}

class ShopChangeButtomNavState extends ShopState{}
class ShopSuccessState extends ShopState{}
class ShopLoadingState extends ShopState{}
class ShopErrorState extends ShopState{}

class ShopSuccessCategoriesState extends ShopState{}
class ShopErrorCategoriesState extends ShopState{}

class ShopSuccessChangeFavoritesState extends ShopState{
  final ChangeFavoritesModel modle;

  ShopSuccessChangeFavoritesState(this.modle);
}
class ShopChangeFavoritesState extends ShopState{}
class ShopErrorChangeFavoritesate extends ShopState{}

class ShopLoadingGetFavoritesState extends ShopState{}
class ShopSuccessGetFavoritesState extends ShopState{}
class ShopErrorGetFavoritesate extends ShopState{}

class ShopLoadingSettingsState extends ShopState{}
class ShopSuccessSettingsState extends ShopState{
  final ShopLoginModel modle;

  ShopSuccessSettingsState(this.modle);
}
class ShopErrorSettingsState extends ShopState{}


class ShopLoadingUserUpdateState extends ShopState{}
class ShopSuccessUserUpdateState extends ShopState{
  final ShopLoginModel modle;

  ShopSuccessUserUpdateState(this.modle);
}
class ShopErrorUserUpdateState extends ShopState{}