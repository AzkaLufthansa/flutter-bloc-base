import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/utils/constants.dart';

abstract class NetworkInfo {
  /// connect to internet return is `true`
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity) {
    observeNetwork();
  }

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return false;
    return true;
  }

  Future<void> observeNetwork() async {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: MESSAGE_UNCONNECTED, toastLength: Toast.LENGTH_SHORT);
      }
    });
  }
}
