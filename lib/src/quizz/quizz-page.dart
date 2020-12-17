import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'package:speedquizz/widgets/layouts/emparejamiento.dart';
import 'package:speedquizz/widgets/layouts/multi-select.dart';
import 'package:speedquizz/widgets/layouts/ordenamiento.dart';
import '../../extras/colores.dart';
import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';
import '../../widgets/layouts/falso-verrdadero.dart';
import './quizz-controller.dart';

class QuizzPage extends StatefulWidget {
  static const route = '/Quizz';
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends StateMVC<QuizzPage> {
  _QuizzPageState() : super(QuizzController()) {
    controller = QuizzController.con;
  }

  QuizzController controller;

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: colores.blanco,
      body: SafeArea(
        child: Column(children: [
          Row(children: [
            Container(
              margin: dimens.fromLTRB(context, .05, .02, .05, 0),
              height: dimens.fullWidth(context) * .25,
              width: dimens.fullWidth(context) * .25,
              padding: dimens.bottom(context, .03),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon.png'))),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Puntos ${provider.puntaje}',
                style: styles.miniBold(context),
              ),
            ),
            Expanded(child: Container()),
            IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  controller.confirmarAyuda(context,
                      controller.preguntas[controller.preguntaActual].ayuda);
                })
          ]),
          Expanded(
            child: Container(
              margin: dimens.all(context, .05),
              decoration: BoxDecoration(
                  color: colores.azul,
                  borderRadius: dimens.borderRadiusContainer(30)),
              child: controller.preguntas.length > 0
                  ? PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      children: controller.preguntas
                          .map((pregunta) => _returnLayout(
                              pregunta, pregunta.tipoPregunta.toString()))
                          .toList())
                  : Container(),
            ),
          )
        ]),
      ),
    );
  }

  Widget _returnLayout(dynamic pregunta, String tipoPregunta) {
    switch (tipoPregunta) {
      case "2":
      case "3":
        return FalsoVerdadero(
            pregunta: pregunta,
            validate: (answer) => controller.validarRespuesta(answer));
        break;

      case "4":
        return Ordenamiento(
            pregunta: pregunta,
            validate: (answer) => controller.validarRespuesta(answer));
        break;

      case "5":
        return Emparejamiento(
            pregunta: pregunta,
            validate: (answer) => controller.validarRespuesta(answer));
        break;

      default:
        return MultiSelect(
          pregunta: pregunta,
          validate: (answer) => controller.validarRespuesta(answer),
        );
    }
  }
}
