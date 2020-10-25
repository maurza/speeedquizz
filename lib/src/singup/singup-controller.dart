import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingupController extends ControllerMVC {
  factory SingupController() {
    _this = SingupController._();
    return _this;
  }
  static SingupController _this;

  SingupController._();

  static SingupController get con => _this;

///// Metodos de aca een adelanteeeeeee
  ///
  ///
  ///
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController institucionController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController nombreController = TextEditingController();

  bool failedRegistro = false;
  String saludo = "Hola";
  singup(context) async {
    print(nickNameController.text);

    final String apiUrl = "https://speedquiz-services.herokuapp.com/agregar";

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final msg = jsonEncode({
      "nombre": nombreController.text,
      "nickName": nickNameController.text,
      "correo": emailController.text,
      "institucion": institucionController.text,
      "carrera": carreraController.text,
      "fechaNacimiento": "1992-02-20",
      "contrasena": passwordController.text
    });

    final response =
        await http.post(apiUrl, headers: requestHeaders, body: msg);
    print(response.body);

    if (json.decode(response.body) == "respusido") {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      setState(() {
        failedRegistro = true;
      });
    }
  }

  returnLogin(context) {
    Navigator.pushReplacementNamed(context, '/');
  }
}
