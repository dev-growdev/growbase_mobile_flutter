import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkAdapter {
  Future<bool> get isConnected;
}

class NetworkAdapter implements INetworkAdapter {
  final Connectivity _connectivity;
  NetworkAdapter(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return !(connectivityResult == ConnectivityResult.none);
  }
}
