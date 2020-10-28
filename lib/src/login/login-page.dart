import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/src/login/login-controller.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';
import 'package:speedquizz/widgets/inputs/email-input.dart';
import 'package:speedquizz/widgets/inputs/password-input.dart';

import '../../widgets/inputs/email-input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateMVC<LoginPage> {
  _LoginPageState() : super(LoginController()) {
    controller = LoginController.con;
  }

  LoginController controller;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardClose = (MediaQuery.of(context).viewInsets.bottom == 0.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: dimens.fullWidth(context) * -.15,
            top: dimens.fullHeigth(context) * -.12,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: isKeyboardClose ? 1 : 0,
              child: Container(
                height: dimens.fullHeigth(context) * .7,
                width: dimens.fullWidth(context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                          paths.fondoLogin,
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
                      Text(
                        'Aprendamos juntos!',
                        style: TextStyle(
                            fontSize: dimens.fullWidth(context) * .045,
                            color: colores.gris),
                      ),
                      EmailInput(emailController: controller.emailController),
                      PasswordInput(
                          passwordController: controller.passwordController),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: dimens.top(context, .01),
                        child: Text(
                          'Olvidaste la contraseña?'.toUpperCase(),
                          style: TextStyle(
                              fontSize: dimens.fullWidth(context) * .04,
                              color: colores.azul,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Visibility(
                          visible: controller.failedAutentication,
                          child: Text(
                            'Email o Contraseña incorrecta!',
                            style: TextStyle(
                                fontSize: dimens.fullWidth(context) * .045,
                                color: Colors.red),
                          )),
                      RounderButton(
                          buttonBorderColor:
                              Hexcolor('#94D9D4').withOpacity(0.7),
                          buttonColor: Hexcolor('#94D9D4'),
                          buttonText: 'Ingresar',
                          onClick: () {
                            controller.login(context);

                            print('My button');
                          }),
                      RounderButton(
                          buttonBorderColor:
                              Hexcolor('#E4907A').withOpacity(0.7),
                          buttonColor: Hexcolor('#E4907A'),
                          buttonText: 'Registrarse',
                          onClick: () {
                            controller.singup(context);
                            print('My button');
                          })
                      //controller.signInButton()
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
