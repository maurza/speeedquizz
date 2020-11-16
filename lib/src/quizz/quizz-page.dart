import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'package:speedquizz/widgets/layouts/multi-select.dart';
import 'package:speedquizz/widgets/layouts/ordenamiento.dart';
import '../../extras/colores.dart';
import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';
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
    return Scaffold(
      backgroundColor: colores.blanco,
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(controller.pageName),
          IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                controller.mostrarAyuda(context, controller.pregunta.ayuda);
              })
        ],
      )),
      body: Container(
        margin: dimens.all(context, .05),
        decoration: BoxDecoration(
            color: colores.azul,
            borderRadius: dimens.borderRadiusContainer(30)),
        child: controller.pregunta != null
            ? _returnLayout(controller.pregunta, controller.type)
            : Container(),
      ),
    );
  }

  _returnLayout(dynamic pregunta, String tipoPregunta) {
    switch (tipoPregunta) {
      case "5":
        return Ordenamiento(pregunta: pregunta);
        break;

      default:
        return MultiSelect(pregunta: pregunta);
    }
  }
}
