import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInit());

  int counter = 0;
  add() {
    emit(UpdateLoadingState());
    counter++;
    // emit(UpdateTextState());
  }

  remove() {
    counter--;
    emit(UpdateTextState());
  }
}
