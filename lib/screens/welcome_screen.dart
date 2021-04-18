import 'package:doodle_demo_app/screens/login_screen.dart';
import 'package:doodle_demo_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:doodle_demo_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doodle_demo_app/widgets/round_button.dart';
import 'package:doodle_demo_app/constants.dart';

class WelcomeScreen extends StatefulWidget {

  static String routeName = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: MediaQuery.of(context).size.width/2,
                child: Image(
                    image: AssetImage('images/turtle.png'),
                )
            ),
            Text('DOODLE...', style: kTitleTextStyle.copyWith(color: kPrimaryColor),),
            RoundedButton(
              title: 'Log In',
              color: kSecondaryColor,
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: kSecondaryColor,
              onPressed: (){
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
            ),
          ]

        ),
      ),
    );
  }
}
