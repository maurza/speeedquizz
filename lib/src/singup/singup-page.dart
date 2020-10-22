import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/src/singup/singup-controller.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';
import 'package:speedquizz/widgets/inputs/carrera-input.dart';
import 'package:speedquizz/widgets/inputs/email-input.dart';
import 'package:speedquizz/widgets/inputs/institucion-input.dart';
import 'package:speedquizz/widgets/inputs/nickname-input.dart';
import 'package:speedquizz/widgets/inputs/nombre-input.dart';
import 'package:speedquizz/widgets/inputs/password-input.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends StateMVC<SingupPage> {
  _SingupPageState() : super(SingupController()) {
    controller = SingupController.con;
  }

  SingupController controller;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardClose = (MediaQuery.of(context).viewInsets.bottom == 0.0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: dimens.fullWidth(context) * .3,
            top: dimens.fullHeigth(context) * -.35,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: isKeyboardClose ? 1 : 0,
              child: Container(
                height: dimens.fullHeigth(context) * .7,
                width: dimens.fullWidth(context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                          paths.fondoSingup,
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: dimens.all(context, .1),
              child: ListView(
                physics: ScrollPhysics(),
                reverse: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        paths.logo,
                        width: dimens.fullWidth(context) * 0.32,
                      ),
                      NicknameInput(),
                      NombreInput(),
                      EmailInput(),
                      InstitucionInput(),
                      CarreraInput(),
                      PasswordInput(),
                      RounderButton(
                          buttonBorderColor:
                              Hexcolor('#94D9D4').withOpacity(0.7),
                          buttonColor: Hexcolor('#E4907A'),
                          buttonText: 'Registrarse',
                          onClick: () {
                            //controller.singup(context);
                            print('My button');
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
