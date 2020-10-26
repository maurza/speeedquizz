import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends ControllerMVC {
  factory LoginController() {
    _this = LoginController._();
    return _this;
  }
  static LoginController _this;

  LoginController._();

  static LoginController get con => _this;

  ///// Metodos de aca een adelanteeeeeee
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List data = [];
  bool failedAutentication = false;
  login(context) async {
    if (emailController.text.isEmpty) {
      setState(() {
        failedAutentication = true;
      });
    } else {
      http.Response response = await http.get(
          'https://speedquiz-services.herokuapp.com/' + emailController.text);
      data = json.decode(response.body);
    }

    if (data.length == 1) {
      if (passwordController.text == data[0]['password']) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      } else {
        setState(() {
          failedAutentication = true;
        });
      }
    } else {
      setState(() {
        failedAutentication = true;
      });
    }
  }

  singup(context) {
    Navigator.pushNamed(context, '/singup');
  }

  String saludo = "Hola";
}
