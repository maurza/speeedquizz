import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/widgets/inputs/fecha-input.dart';
import 'package:speedquizz/widgets/inputs/text-input.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: dimens.all(context, .05),
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Divertete\naprendiendo!',
                      textAlign: TextAlign.center,
                      style: styles.extraLargeBold(context)),
                  Stack(children: [
                    Container(
                        margin: dimens.vertical(context, .05),
                        height: dimens.fullWidth(context) * .5,
                        width: dimens.fullWidth(context) * .5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/icon.png')))),
                    Container(
                      margin: dimens.bottom(context, .1),
                      height: dimens.fullWidth(context) * .5,
                      width: dimens.fullWidth(context) * .5,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '0 Pts',
                        style: styles.extraLargeBold(context),
                      ),
                    ),
                  ]),
                  TextInput(
                    labelText: 'Nombre',
                    textController: controller.nombreController,
                  ),
                  TextInput(
                    labelText: 'Email',
                    textController: controller.emailController,
                  ),
                  FechaInput(onConfirm: () {}, value: controller.fecha),
                  TextInput(
                    labelText: 'Carrera',
                    textController: controller.careraController,
                  ),
                  TextInput(
                    labelText: 'Institucion',
                    textController: controller.institucionController,
                  ),
                  RounderButton(
                      buttonColor: colores.azul,
                      buttonBorderColor: colores.azul,
                      buttonText: 'Aceptar',
                      onClick: () => controller.goToLobby())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
