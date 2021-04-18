import 'package:doodle_demo_app/constants.dart';
import 'package:doodle_demo_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PreferenceScreen extends StatefulWidget {

  static String routeName = 'preference_screen';

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preference', style: kTitleTextStyle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('images/turtle.png'),
          ),
          Text(FirebaseAuth.instance.currentUser.email),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()),
                  (route) => false
              );
            },
            child: Text('LOGOUT'),
          )
        ],
      )
    );
  }
}
