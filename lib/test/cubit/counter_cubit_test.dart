import 'dart:developer';

import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test_api/test_api.dart';

// import 'package:test/src/executable.dart';
void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('the initial State is Counter with value 0', () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, isIncremented: false));
    });

    blocTest(
      'Test Increment of the CounterCubit and it should emit counterValue: 1',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, isIncremented: true)],
    );

    blocTest(
      'Test Decrement of the CounterCubit and it should emit counterValue: -1',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, isIncremented: false)],
    );
  });
}
