import 'dart:async';

import 'package:bloc_counter/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  void emitInternectConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisonnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emitInternectConnected(ConnectionType.wifi);
      } else if (event == ConnectivityResult.mobile) {
        emitInternectConnected(ConnectionType.mobileData);
      } else if (event == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }
}
