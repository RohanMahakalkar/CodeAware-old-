import 'package:firebase_auth/firebase_auth.dart';

class SignupUsingEmail {
  static Future<User?> signUpUsingEmail({
    required String firstName,
    required String lastname,
    required String email,
    required String password,
}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      user = userCredential.user;
      await user!.sendEmailVerification();
      await user.updateDisplayName(firstName+lastname);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        print('weak password');
      }else if(e.code=='email-already-in-use'){
        print('Account already exist from this email.');
      }
    }catch(e){
      print(e);
    }
    return user;
  }
}