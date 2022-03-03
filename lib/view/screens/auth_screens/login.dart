import 'dart:html';

import 'package:flutter/material.dart';
import 'package:code_aware/view/widgets/custom_button.dart';
import 'package:code_aware/view/widgets/custom_textform.dart';
import 'package:code_aware/controller/validators.dart';

class LogInScreen extends StatefulWidget{
  @override
  State<LogInScreen> createState() => MyLogInScreen();

}
class MyLogInScreen extends State<LogInScreen> {
  late Validator email;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color.fromARGB(179, 235, 228, 248),
      body: SingleChildScrollView(
        child: Column(
          children:  <Widget>[
            Image.asset('assets/images/logo.png'),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'CodeAware',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(100, 45, 28, 71),
                    fontFamily: 'Comfortaa',
                ),
              ),
            ),
            const Text(
              'Login To Your Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(100, 45, 28, 71),
              ),
            ),
            CustomTextForm(label: 'Email', hintText: 'example@gmail.com', color: Colors.white, validator:validateEmail(), obscureText: false, width: width, textInputType: textInputType, onChange: onChange, border: border),
            CustomTextForm(label: 'Password', hintText: '...', color: Colors.white, validator: validator, obscureText: false, width: width, textInputType: textInputType, onChange: onChange, border: border),
            Container(
              child:CustomButton(label: "sign in", onPressed: onPressed, color: Colors.deepPurple),
            ),
            Row(
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                ),
                TextButton(
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              children: const <Widget>[
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 0,
                  endIndent: 80,
                  color: Colors.black,
                ),
                Text('or'),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 80,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                color: const Color(0xFFBF3232),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset('assets/icons/googleicon.png'),
                      const SizedBox(width: 12),
                      const Text('Sign in with Google'),
                    ],
                  ),
                ),
              ),
            ),
          ],
      ),
      ),
    );

  }

}