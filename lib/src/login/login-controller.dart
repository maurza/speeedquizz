import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
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

  List data;
  bool failedAutentication = false;
  login(context) async {
    http.Response response =
        await http.get('http://10.0.2.2:3000/' + emailController.text);
    data = json.decode(response.body);
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

  String saludo = "Hola";
}
