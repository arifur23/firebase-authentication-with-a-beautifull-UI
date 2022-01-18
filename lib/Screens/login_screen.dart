import 'package:firebase_authentication/Screens/registration_screen.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/password_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EFF3),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text('Hello Again!',style: boldTextStyle,),
            const SizedBox(height: 10,),
            const Text('Welcome back, you have been missed!',style: semiBoldTextStyle,),
            const SizedBox(height: 50,),
            const PasswordForm(),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text('Do not have an account?'),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                    },
                    child: const Text('click here'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
