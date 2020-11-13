import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'package:speedquizz/widgets/layouts/multi-select.dart';
import 'package:speedquizz/widgets/layouts/ordenamiento.dart';
import '../../extras/colores.dart';
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
    dynamic args = ModalRoute.of(context).settings.arguments;
    String type = args["type"];
    dynamic pregunta = args["pregunta"];

    return Scaffold(
      backgroundColor: colores.azul,
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(controller.pageName),
          IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                controller.mostrarAyuda(context, pregunta.ayuda);
              })
        ],
      )),
      body: Container(
        child: _returnLayout(pregunta, type),
      ),
    );
  }

  _returnLayout(dynamic pregunta, String tipoPregunta) {
    switch (tipoPregunta) {
      case "5":
        Provider.of<PreguntaProvider>(context).opcionesCorrectas =
            (pregunta.opciones);
        return Ordenamiento(pregunta: pregunta);
        break;

      default:
        return MultiSelect(pregunta: pregunta);
    }
  }
}
