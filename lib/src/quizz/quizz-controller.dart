import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';

class QuizzController extends ControllerMVC {
  factory QuizzController() {
    _this = QuizzController._();
    return _this;
  }
  static QuizzController _this;

  QuizzController._();

  static QuizzController get con => _this;

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
