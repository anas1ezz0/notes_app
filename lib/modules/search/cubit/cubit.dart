// ignore_for_file: avoid_print

import 'package:app/models/shop_app/search_model.dart';
import 'package:app/modules/search/cubit/state.dart';
import 'package:app/shared/components/constants.dart';
import 'package:app/shared/network/end_pointes.dart';
import 'package:app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchIntialaState());
  static SearchCubit get(context) => BlocProvider.of(context);


  SearchModel?model;

  void search(String text)
  {
    emit(SearchLoadingState());
DioHelper.postData(
  url: SEARCH,
  token: token,
 data: {
  'text':text,
},

).then((value) {
  model = SearchModel.fromJson(value.data);
  emit(SearchSuccessState());
} ).catchError((error){
  print(error.toString()); 
  emit(SearchErrorState());
});
  }
}