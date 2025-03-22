import 'package:flutter/material.dart';
import 'package:zippy/di/injection.dart';
import 'package:zippy/run_app.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ZippyApp());
}
