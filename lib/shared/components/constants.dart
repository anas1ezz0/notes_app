// https://newsapi.org/v2/everything?q=tesla&&apiKey=e8bf3ec647764b12bbd0ea0c083fd596
import 'package:app/layout/shop_app/shop_login/shop_login_screen.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/network/remote/cash_helper.dart';

void signOut(context)
{
  CashHelper.removeData(key: 'token').then((value){
    navigateTo(context, ShopLogin());
  });
}
void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
String token = '';