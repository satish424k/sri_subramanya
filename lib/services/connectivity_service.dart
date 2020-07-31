import 'dart:async';

import 'package:connectivity/connectivity.dart';

import 'package:connectivity/connectivity.dart';
import 'package:kavadi_ustav_2020/utils/connectivity.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var connectionStatus = _getResultFromResult(result);
      connectionStatusController.add(connectionStatus);
    });
  }

  ConnectivityStatus _getResultFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
        break;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
        break;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
        break;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
