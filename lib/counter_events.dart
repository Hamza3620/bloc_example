// EVENTS
import 'package:equatable/equatable.dart';

class CounterEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvents {}

class DecreaseCounter extends CounterEvents {}
