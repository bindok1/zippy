import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zippy/features/auth/cubit/auth_state.dart';
import 'auth_state.dart' as auth_cbt;

class AuthCubit extends Cubit<auth_cbt.AuthState> {
  final supbase = Supabase.instance.client;
  

  AuthCubit() : super( AuthInitial());

  Future<void> checkAuth() async {
    emit(AuthLoading());
    try {
      final session = supbase.auth.currentSession;
      if (session != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}