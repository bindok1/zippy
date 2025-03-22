import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippy/core/http/http_provider.dart';

@module
abstract class AppModule {
  // Local Storage
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Network
  @lazySingleton
  HttpProvider get httpProvider => HttpProvider();

}