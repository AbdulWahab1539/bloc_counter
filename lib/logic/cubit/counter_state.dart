// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unnecessary_this

part of 'counter_cubit.dart';

// abstract class CounterState {}
// @immutable
class CounterState {
  int counterValue;
  bool isIncremented;

  CounterState({
    required this.counterValue,
    required this.isIncremented,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'isIncremented': isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      isIncremented: map['isIncremented'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, isIncremented: $isIncremented)';
}
