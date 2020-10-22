import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    _this = LoginController._();
    return _this;
  }
  static LoginController _this;

  LoginController._();

  static LoginController get con => _this;

///// Metodos de aca een adelanteeeeeee
  ///
  ///

  String saludo = "Hola";
  login(context) {
    Navigator.pushReplacementNamed(context, '/onboarding');
  }

  singup(context) {
    Navigator.pushReplacementNamed(context, '/singup');
  }
}
