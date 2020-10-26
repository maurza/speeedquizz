import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedquizz/src/login/login-page.dart';
import 'package:speedquizz/src/onboarding/onboarding-page.dart';
import 'package:speedquizz/src/singup/singup-page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:speedquizz/src/welcome/welcome-page.dart';

void main() {
  /// esta configuracion sirve para mostrar las fechas en diferentes lenguajes
  initializeDateFormatting('es', null);
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
        '/singup': (context) => SingupPage(),
        '/welcome': (context) => WelcomePage()
      },
      initialRoute: '/',
    );
  }
}
