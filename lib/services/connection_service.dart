import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:zippy/constant/api_const.dart';

@lazySingleton
class ConnectionService {
  Future<bool> get isConnected => _checkConnection();

  Future<bool> _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}