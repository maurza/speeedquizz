import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/src/quizz/quizz-page.dart';
import './lobby-controller.dart';

class LobbyPage extends StatefulWidget {
  static const route = 'lobby';
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends StateMVC<LobbyPage> {
  _LobbyPageState() : super(LobbyController()) {
    controller = LobbyController.con;
  }

  LobbyController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Bienvenido"),
          IconButton(
              icon: Icon(Icons.supervised_user_circle_rounded,
                  color: Colors.white),
              onPressed: () {
                controller.irAlPerfil();
              }),
        ],
      )),
      body: Container(
          width: dimens.fullWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    /*Navigator.pushNamed(context, QuizzPage.route,
                        arguments: {"type": "FalsoVerdadero"});*/
                    controller.obtenerDatosPregunta("3");
                  },
                  child: Text("Ir a Falso y verdadero")),
              FlatButton(
                  onPressed: () {
                    /*Navigator.pushNamed(context, QuizzPage.route,
                        arguments: {"type": "MultiSelect"});*/
                    controller.obtenerDatosPregunta("2");
                  },
                  child: Text("Ir a Seleccion Multiple Unica Respuesta"))
            ],
          )),
    );
  }
}
