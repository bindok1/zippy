import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zippy/core/http/http_provider.dart';

@module
abstract class AppModule {
  //Global Keys
  @lazySingleton
  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey => GlobalKey<ScaffoldMessengerState>();

  // Local Storage
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Network
  @lazySingleton
  HttpProvider get httpProvider => HttpProvider();


}