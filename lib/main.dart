import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:code_aware/view/screens/auth_screens/login.dart';
import 'package:code_aware/view/screens/auth_screens/welcome.dart';
import 'package:code_aware/view/screens/auth_screens/signup.dart';
import 'package:code_aware/view/screens/in_app_screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyCodeAware());
}

class MyCodeAware extends StatefulWidget{
  const MyCodeAware({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  CodeAware createState() => CodeAware();
}

class CodeAware extends State<MyCodeAware> {
  late StreamSubscription<User?> user;

  @override
  void initState(){
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user==null){
        print("user is currently signed out");
      }else{
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose(){
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser==null ? 'login_screen':'home_page',
      routes: {
        'welcome': (context) => WelcomeScreen(),
        'signup_screen': (context) => SignUpScreen(),
        'login_screen' : (context) => LogInScreen(),
        'home_page' : (context) => HomeScreen()
      },
      home: WelcomeScreen(),
    );
  }
}
