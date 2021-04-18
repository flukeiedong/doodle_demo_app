import 'package:doodle_demo_app/screens/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:doodle_demo_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static String routeName = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String userName;
  String password;
  bool _loading = false;

  void signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userName,
          password: password
      );
      Navigator.popAndPushNamed(context, CatalogScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: kTextFieldLogIn.copyWith(
                  hintText: 'Enter Username',
                ),
                onChanged: (value) {
                  userName = value;
                },
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: kTextFieldLogIn.copyWith(
                  hintText: 'Enter Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 10.0),
              TextButton(
                  onPressed: () async {
                    signIn();
                    setState(() {
                      _loading = true;
                    });
                  },
                  child: Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
