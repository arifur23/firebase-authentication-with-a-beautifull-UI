
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/Screens/home_screen.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({Key? key}) : super(key: key);
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
  }

  late bool see = true;

  void onPressed(){
    see != see;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, child ) => Column(
          children: [
            const Text('Sign In',style: normalTextStyle,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email address to continue';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.close),
                          )
                        ),
                        obscureText: see,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 16),
                          StyledButton(
                            onPressed: () {
                              email = _emailController.text;
                              password = _passwordController.text;
                              var currentUser = FirebaseAuth.instance.currentUser;
                              if(currentUser == null){
                                appState.signInWithEmailAndPassword(email, password, (e) { });
                              }
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                            },
                            child: const Text('SIGN IN'),
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}