import 'package:firebase_authentication/Screens/login_screen.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:firebase_authentication/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

 late String email;
 late String disPlayName;
 late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApplicationState>(
          builder: (context, appState, child) => SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 100,),
                  const Header('Create account'),
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
                              controller: _displayNameController,
                              decoration: const InputDecoration(
                                hintText: 'First & last name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your account name';
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
                              ),
                              obscureText: true,
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
                                TextButton(
                                  onPressed: (){
                                    appState.cancelRegistration();
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                  },
                                  child: const Text('CANCEL'),
                                ),
                                const SizedBox(width: 16),
                                StyledButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      email = _emailController.text;
                                      password = _passwordController.text;
                                      disPlayName = _displayNameController.text;

                                      appState.registerAccount(email, disPlayName, password, (e) { });
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                    }
                                  },
                                  child: const Text('SAVE'),
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
              ),
            ),
          )
      ),
    );
  }
}
