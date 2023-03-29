// ignore_for_file: unnecessary_this

part of 'counter_cubit.dart';

// abstract class CounterState {}
// @immutable
class CounterState extends Equatable {
  int counterValue;
  bool isIncremented;

  CounterState({
    required this.counterValue,
    required this.isIncremented,
  });

  @override
  List<Object?> get props => [this.counterValue, this.isIncremented];
}
