import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:code_aware/view/widgets/custom_button.dart';
import 'package:code_aware/view/widgets/custom_textform.dart';
import 'package:code_aware/controller/validators.dart';
import 'package:code_aware/model/authentication/signin_using_email.dart';
import 'package:code_aware/view/screens/in_app_screens/home.dart';
class LogInScreen extends StatefulWidget{
  const LogInScreen({Key? key}) : super(key: key);
  static String routeName = 'login-page';

  @override
  State<LogInScreen> createState() => MyLogInScreen();
}
class MyLogInScreen extends State<LogInScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  late String email;
  late String password;

  Widget _loginUi(){
    return Column(
      children:  <Widget>[
        Image.asset('assets/images/logo.png',width: 200,),
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
        CustomTextForm(prefixIcon: const Icon(Icons.email),
          controller: _controller,
          label: 'Email',
          hintText: 'example@gmail.com',
          color: Colors.white,
          validator: (value) => Validator.validateEmail(email:value),
          obscuretext: false,
          textInputAction : TextInputType.emailAddress,
          onSaved: (value) {email=value!;},),
        CustomTextForm(prefixIcon: const Icon(Icons.password),
          controller: _controller,
          label: 'Password',
          hintText: '***',
          color: Colors.white,
          validator: (value) => Validator.validatePassword(password: value),
          obscuretext: true,
          textInputAction: TextInputType.text,
          onSaved: (value) {password = value!;},),
        CustomButton(
            label: "sign in",
            onPressed: () async {
              if(_key.currentState!.validate()){
                User? user = await SigninUsingEmail.signInUsingEmail(
                    email: email, 
                    password: password);
                if(user!=null){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context)=>const HomeScreen())
                  );
                }
              }
            },
            color: Colors.deepPurple),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(179, 235, 228, 248),
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: _loginUi()),
              ),
            ),
          )
    );

  }

}