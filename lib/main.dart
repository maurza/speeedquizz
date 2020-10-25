import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedquizz/src/login/login-page.dart';
import 'package:speedquizz/src/onboarding/onboarding-page.dart';
import 'package:speedquizz/src/singup/singup-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/singup': (context) => SingupPage()
      },
      initialRoute: '/',
    );
  }
}
