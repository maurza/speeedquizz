import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/user.dart';
import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../providers/user-provider.dart';
import '../../widgets/buttons/rounder-button.dart';
import './welcome-controller.dart';

class WelcomePage extends StatefulWidget {
  static String route = '/welcome';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends StateMVC<WelcomePage> {
  _WelcomePageState() : super(WelcomeController()) {
    controller = WelcomeController.con;
  }

  WelcomeController controller;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido! ' + user.nickname)),
      body: Container(
        padding: dimens.all(context, .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tus  datos de registro  son:',
              style: styles.large(context),
            ),
            Text(
              'nickName: ' + user.nickname,
              style: styles.large(context),
            ),
            Text(
              'Correo: ' + user.correo,
              style: styles.large(context),
            ),
            Text(
              'Fnac: ' + user.fecha_nacimiento,
              style: styles.large(context),
            ),
            Text(
              'Carrera: ' + user.carrera,
              style: styles.large(context),
            ),
            Text(
              'Instittucion: ' + user.institucion,
              style: styles.large(context),
            ),
            Expanded(child: Container()),
            RounderButton(
              buttonColor: colores.azul,
              buttonBorderColor: colores.azul,
              buttonText: 'Aceptar',
              onClick: () => controller.goToLobby(),
            )
          ],
        ),
      ),
    );
  }
}
