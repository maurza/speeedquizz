import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/providers/user-provider.dart';

import '../lobby/lobby-page.dart';

class WelcomeController extends ControllerMVC {
  factory WelcomeController() {
    _this = WelcomeController._();
    return _this;
  }
  static WelcomeController _this;

  WelcomeController._();

  static WelcomeController get con => _this;

  BuildContext context;

  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController careraController = TextEditingController();
  TextEditingController institucionController = TextEditingController();
  String fecha = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
      User user = Provider.of<UserProvider>(context, listen: false).user;

      nombreController.text = user.nombre;
      emailController.text = user.correo;
      careraController.text = user.carrera;
      institucionController.text = user.institucion;
      fecha = DateFormat('y-M-d', 'es')
          .format(DateTime.parse(user.fecha_nacimiento));

      setState(() {});
    });
    super.initState();
  }

  goToLobby() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LobbyPage.route,
      (Route<dynamic> route) => false,
    );
  }
}
