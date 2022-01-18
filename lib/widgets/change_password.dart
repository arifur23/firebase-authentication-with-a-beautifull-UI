import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:provider/provider.dart';
import 'package:firebase_authentication/src/widgets.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _emailController.text = widget.email;
  }

  late String newPassword;

  final currentUser = FirebaseAuth.instance.currentUser;

  // void _showErrorDialog(BuildContext context, String title, Exception e) {
  //   showDialog<void>(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(
  //           title,
  //           style: const TextStyle(fontSize: 24),
  //         ),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(
  //                 '${(e as dynamic).message}',
  //                 style: const TextStyle(fontSize: 18),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           StyledButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text(
  //               'OK',
  //               style: TextStyle(color: Colors.deepPurple),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Header('Change Password'),
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
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'New Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter new password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: 16),
                            StyledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 30),
                            StyledButton(
                              onPressed: () {
                                newPassword = _passwordController.text;
                                appState.changePassword(newPassword);
                                  appState.signOut();
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content:  Text('Password Changed'),));

                                print(currentUser!.displayName);
                                print(newPassword);
                              },
                              child: const Text('Confirm'),
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
    );
  }
}
