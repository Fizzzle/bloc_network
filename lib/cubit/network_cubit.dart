import 'dart:async';

import 'package:bloc_network/cubit/network_cubit_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionCubit extends Cubit<MyConnectState> {
  late StreamSubscription<ConnectivityResult> _subscription;

  ConnectionCubit() : super(MyConnectState(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      emit(MyConnectState(result != ConnectivityResult.none));
    }); 
  }

  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

}