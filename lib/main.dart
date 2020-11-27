import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'package:speedquizz/src/changePassword/changePassword-page.dart';
import 'package:speedquizz/src/lobby/lobby-page.dart';
import 'package:speedquizz/src/login/login-page.dart';
import 'package:speedquizz/src/onboarding/onboarding-page.dart';
import 'package:speedquizz/src/perfil/perfil-page.dart';
import 'package:speedquizz/src/quizz/quizz-page.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<PreguntaProvider>(
            create: (_) => PreguntaProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/singup': (context) => SingupPage(),
          '/welcome': (context) => WelcomePage(),
          LobbyPage.route: (context) => LobbyPage(),
          PerfilPage.route: (context) => PerfilPage(),
          QuizzPage.route: (context) => QuizzPage(),
          ChangePasswordPage.route: (context) => ChangePasswordPage()
        },
        initialRoute: '/',
      ),
    );
  }
}
