// STATES
import 'package:equatable/equatable.dart';

class CounterStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CounterStates {}

class IdleState extends CounterStates {
  final _counter;
  IdleState(this._counter);

  int get getCountValue => _counter;

  @override
  List<Object> get props => [_counter];
}
