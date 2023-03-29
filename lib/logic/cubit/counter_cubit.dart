import 'package:equatable/equatable.dart';

import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
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

  // @override
  // Future<void> close() {
  //   streamSubscription.cancel();
  //   return super.close();
  // }
}
