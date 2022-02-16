import 'package:firebase_auth/firebase_auth.dart';

class SigninUsingEmail{
  static Future<User?> signInUsingEmail({
    required String email,
    required String password
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code=='user-not-found'){
        print("No account exist by this email.");
      }else if(e.code=="wrong-password"){
        print("wrong password");
      }
    }
    return user;
  }
}