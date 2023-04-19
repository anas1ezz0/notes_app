

import 'package:app/layout/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(CounterIntialState());


  static CounterCubit get(context)=>BlocProvider.of(context);
  int counter =1;



void minus(){
  counter--;
  emit(CounterMinusState(counter));
}

void plus(){
  counter++;
  emit(CounterPlusState(counter));
}

}









