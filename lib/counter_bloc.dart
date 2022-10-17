import 'package:bloc_example/counter_events.dart';
import 'package:bloc_example/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;
  CounterBloc(CounterStates initialState) : super(initialState) {
    on<IncreaseCounter>((event, emit) async {
      emit(LoadingState());

      // some op here
      await Future.delayed(Duration(seconds: 2));
      counter += 1;

      emit(IdleState(counter));
    });

    on<DecreaseCounter>(((event, emit) async {
      emit(LoadingState());

      // some op here
      await Future.delayed(Duration(seconds: 2));
      counter -= 1;

      emit(IdleState(counter));
    }));
  }
}
