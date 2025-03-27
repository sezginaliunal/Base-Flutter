import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController {
  // İnternet bağlantısı olup olmadığını kontrol eden metod
  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return _isOnline(connectivityResult.first);
  }

  // Bağlantı durumunu kontrol eden yardımcı metod
  bool _isOnline(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.none:
        return false;
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.other:
        return true;
    }
  }
}
