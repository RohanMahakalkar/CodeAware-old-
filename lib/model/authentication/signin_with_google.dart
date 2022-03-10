import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {
  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await account
        ?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}