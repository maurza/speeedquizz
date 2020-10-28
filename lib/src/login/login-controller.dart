import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/constants.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'dart:convert';

import 'package:speedquizz/src/lobby/lobby-page.dart';

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
      http.Response response =
          await http.get(Constants().url + emailController.text);
      data = json.decode(response.body);
    }

    if (data.length == 1) {
      if (passwordController.text == data[0]['password']) {
        Provider.of<UserProvider>(context, listen: false).user =
            User.fromJson(data[0]);
        Navigator.pushReplacementNamed(context, LobbyPage.route);
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
