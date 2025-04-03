import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zippy/constant/api_const.dart';

class cAuthService {
  final supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn(
    clientId: ApiConst.googleClientId,
    serverClientId: ApiConst.webClientId,
  );
  User? get currentUser => supabase.auth.currentUser;
  String? get userEmail => currentUser?.email;
  String? get userName => currentUser?.userMetadata?['full_name'] as String?;

  Future<AuthResponse> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth == null) {
      throw 'No Google Auth credentials';
    }

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }

    if (idToken == null) {
      throw 'No ID Token found.';
    }

    // Sign in to Supabase
    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await supabase.auth.signOut();
  }
}
