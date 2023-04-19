// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:app/layout/shop_app/shop_layout/shop_layout_screan.dart';
import 'package:app/shared/bloc_observer.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'layout/shop_app/onBoarding/onBoarding_screen.dart';
import 'layout/shop_app/shop_login/shop_login_screen.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/state.dart';
import 'shared/network/remote/cash_helper.dart';
import 'shared/styles/styles.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();

  bool? isDark = CashHelper.getData(key: 'isDark');

Widget widget;
bool? onBoarding = CashHelper.getData(key: 'onBoarding');
var token = CashHelper.getData(key: 'token');
if (kDebugMode) {
  print(token);
}
if(onBoarding != null)
{
// ignore: unnecessary_null_comparison
if(token!=null) {
  widget = ShopLayoutScrean();
} else {
  widget = ShopLogin();
}
}
else
{
widget = OnBoardingScreen(); 
} 
  runApp(MyApp(
  isDark :isDark,
  startWidget :widget,
));
}
class MyApp extends StatelessWidget
{
  final bool? isDark;
  final Widget startWidget;

  MyApp({super.key, 
  required this.isDark,
  required this.startWidget
});

  @override
  Widget build(BuildContext context)
  {
    return   MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>NewsCubit()..getBusiness()),
        BlocProvider(create: (BuildContext context)=>AppCubit()..changeAppMode(
          fromsShared:isDark,
        ),),
         BlocProvider(create:(context)=>ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
         ),

      ],
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:themeModelight,
            darkTheme: themeModedark,
            themeMode:AppCubit.get(context).isDark?ThemeMode.light:ThemeMode.light,
            home:NewsLayout()
          );
        },
      ),
    );
  }
}





