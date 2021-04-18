import 'package:flutter/material.dart';
import 'package:doodle_demo_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {

  static String routeName = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String userName;
  String password;

  void createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userName,
        password: password,
      );
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  createAccount();
                },
                child: Text('Register')
            ),
          ],
        ),
      ),
    );
  }
}
