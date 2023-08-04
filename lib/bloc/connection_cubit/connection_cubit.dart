import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionStatus {}

class ConnectionInitial extends ConnectionStatus {}

class ConnectionSuccess extends ConnectionStatus {}

class ConnectionFailure extends ConnectionStatus {}

class ConnectionCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription subscription;
  bool _initialState = true;

  ConnectionCubit() : super(ConnectionInitial()) {
    checkConnection();
  }

  Future<void> checkConnection() async {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        await _updateConnectionStatus();
      },
    );
    await _updateConnectionStatus();
    _initialState = false;
  }

  Future<void> _updateConnectionStatus() async {
    if (await InternetConnectionChecker().hasConnection) {
      if (!_initialState) {
        emit(ConnectionSuccess());
      }
    } else {
      emit(ConnectionFailure());
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
