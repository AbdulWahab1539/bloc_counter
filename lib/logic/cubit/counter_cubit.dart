import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  // final InternetCubit internetCubit;
  // late StreamSubscription streamSubscription;

  CounterCubit() //{required this.internetCubit}
      : super(CounterState(counterValue: 0, isIncremented: false));
  //     {
  //   monitorInternetConnection();
  // }

  // StreamSubscription<InternetState> monitorInternetConnection() {
  //   return streamSubscription = internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.mobileData) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // addError(Exception("Could not write to storage"), StackTrace.current);
    return state.toMap();
  }

  // @override
  // void onChange(Change<CounterState> change) {
  //   print(change);
  //   super.onChange(change);
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print(error);
  //   super.onError(error, stackTrace);
  // }
  // @override
  // Future<void> close() {
  //   streamSubscription.cancel();
  //   return super.close();
  // }
}
