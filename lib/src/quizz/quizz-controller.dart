import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/services/quizz-service.dart';

import '../../providers/pregunta-provide.dart';

class QuizzController extends ControllerMVC {
  factory QuizzController() {
    _this = QuizzController._();
    return _this;
  }
  static QuizzController _this;
  BuildContext context;
  QuizzController._();

  static QuizzController get con => _this;
  String type = '';
  dynamic pregunta;
  List<Pregunta> preguntas = [];
  int preguntaActual = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      context = con.stateMVC.context;
      setState(() {});

      dynamic args = ModalRoute.of(context).settings.arguments;
      type = args["type"];
      pregunta = args["pregunta"];
      /* if (type == '5') {
        Provider.of<PreguntaProvider>(context, listen: false)
            .opcionesCorrectas = (pregunta.opciones);
        print(Provider.of<PreguntaProvider>(context, listen: false)
            .opcionesCorrectas);
      } */

      List response = await QuizzService().obtenerQuizz();
      for (var item in response) {
        Pregunta pregunta = Pregunta.fromJson(item);

        preguntas.add(pregunta);
      }

      setState(() {});
    });
    super.initState();
  }

  validarRespuesta(answer) {
    if (preguntaActual < preguntas.length - 1) {
      preguntaActual = preguntaActual + 1;
      pageController.jumpToPage(preguntaActual);

      setState(() {});
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: dimens.borderRadius(10.0),
            content: Text('Final de quiz'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'ACEPTAR',
                  style: TextStyle(color: colores.purpuracards),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); //Cierra la alerta
                  Navigator.of(context).pop(); //Cierra la vista
                },
              ),
            ],
          );
        },
      );
    }
  }

  mostrarAyuda(BuildContext context, String ayuda) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: dimens.borderRadius(10.0),
          content: Text(ayuda ?? ''),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'ACEPTAR',
                style: TextStyle(color: colores.purpuracards),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String pageName = 'Quizz';
}
