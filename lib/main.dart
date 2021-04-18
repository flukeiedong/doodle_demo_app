import 'package:doodle_demo_app/screens/catalog_screen.dart';
import 'package:doodle_demo_app/screens/login_screen.dart';
import 'package:doodle_demo_app/screens/preference_screen.dart';
import 'package:doodle_demo_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:doodle_demo_app/screens/slide_screen.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  User currentUser = FirebaseAuth.instance.currentUser;
  String initialRoute() {
    if (currentUser != null) {
      return CatalogScreen.routeName;
    }
    else {
      return WelcomeScreen.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
        fontFamily: 'BalsamiqSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: initialRoute(),
      routes: {
        CatalogScreen.routeName: (context) => CatalogScreen(),
        SlideScreen.routeName: (context) => SlideScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        PreferenceScreen.routeName : (context) => PreferenceScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },

    );
  }
}

