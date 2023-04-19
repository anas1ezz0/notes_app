import 'package:app/shared/cubit/state.dart';
import 'package:app/shared/network/remote/cash_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit():super(AppIntialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromsShared})
  {
    if(fromsShared!=null)
    {
      
      isDark = fromsShared;
       emit(AppChangeAppModeState());
    }else {
      isDark = !isDark;
       CashHelper.putBoolean(key: 'isDark', value: isDark).then((value)
     {
          emit(AppChangeAppModeState());
    });
    } 
   

  }
  
}






