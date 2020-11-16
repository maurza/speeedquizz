import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';

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
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
      setState(() {});

      dynamic args = ModalRoute.of(context).settings.arguments;
      type = args["type"];
      pregunta = args["pregunta"];
      if (type == '5') {
        Provider.of<PreguntaProvider>(context, listen: false)
            .opcionesCorrectas = (pregunta.opciones);
        print(Provider.of<PreguntaProvider>(context, listen: false)
            .opcionesCorrectas);
      }

      setState(() {});
    });
    super.initState();
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
