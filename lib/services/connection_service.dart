import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:zippy/constant/api_const.dart';

@lazySingleton
class ConnectionService {
  final InternetConnection _connectionChecker;
  final Connectivity _connectivity;

  ConnectionService()
      : _connectionChecker = InternetConnection.createInstance(
          checkInterval: const Duration(seconds: 5),
          customCheckOptions: [
            InternetCheckOption(
              uri: Uri.parse(ApiConst.baseUrl),
              responseStatusFn: (response) => response.statusCode == 200,
            ),
            InternetCheckOption(
              uri: Uri.parse('https://google.com'),
            ),
          ],
        ),
        _connectivity = Connectivity();

  Future<bool> get isConnected => _connectionChecker.hasInternetAccess;

  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  Future<List<ConnectivityResult>> checkConnectivity() =>
      _connectivity.checkConnectivity();

  Stream<bool> get onConnectionChange => _connectionChecker.onStatusChange
      .map((status) => status == InternetStatus.connected);
}
