import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zippy/constant/api_const.dart';
import 'package:zippy/di/injection.dart';
import 'package:zippy/run_app.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: ApiConst.supabaseUrl,
    anonKey: ApiConst.supabaseAnonKey,
  );
  await configureDependencies();
  runApp(const ZippyApp());
}
