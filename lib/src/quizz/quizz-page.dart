import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/widgets/layouts/multi-select.dart';
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
    Pregunta pregunta = args["pregunta"];

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
                controller.mostrarAyuda(context, pregunta.tip);
              })
        ],
      )),
      body: Container(
        child: /*type == "2"
            ?*/
            MultiSelect(
          pregunta: pregunta,
        )
        /*: Center(
                child: Text(controller.pageName + ""),
              )*/
        ,
      ),
    );
  }
}
