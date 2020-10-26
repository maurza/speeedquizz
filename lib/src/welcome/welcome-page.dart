import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/user.dart';
import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../widgets/buttons/rounder-button.dart';
import './welcome-controller.dart';

class WelcomePage extends StatefulWidget {
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
    /// con esta estructura se oobtienen los  datos que se  enviarron
    /// de la vista anteriior
    User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido! ' + user.nickName)),
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
              'Nickname: ' + user.nickName,
              style: styles.large(context),
            ),
            Text(
              'Correo: ' + user.correo,
              style: styles.large(context),
            ),
            Text(
              'Fnac: ' + user.fechaNacimiento,
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
              onClick: () => controller.goToOnboarding(),
            )
          ],
        ),
      ),
    );
  }
}
