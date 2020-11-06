import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/src/quizz/quizz-page.dart';
import 'package:speedquizz/widgets/cards/simple-card.dart';
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
          child: ListView(
            padding: dimens.all(context, .03),
            children: [
              SimpleCard(
                  color: colores.amarillocards,
                  texto: "Seleccion multiple varias respuestas",
                  imagepath: "assets/images/card3.png",
                  onClick: () => controller.obtenerDatosPregunta("1")),
              SimpleCard(
                  color: colores.verdecards,
                  texto: "Seleccion multiple",
                  imagepath: "assets/images/card1.png",
                  onClick: () => controller.obtenerDatosPregunta("2")),
              SimpleCard(
                  color: colores.azulcards,
                  texto: "Falso y verdadero",
                  imagepath: "assets/images/card2.png",
                  onClick: () => controller.obtenerDatosPregunta("3")),
              SimpleCard(
                  color: colores.rojocards,
                  texto: "Completar",
                  imagepath: "assets/images/card4.png",
                  onClick: () => controller.obtenerDatosPregunta("4")),
              SimpleCard(
                  color: colores.purpuracards,
                  texto: "Seleccion de opciones ",
                  imagepath: "assets/images/card5.png",
                  onClick: () => controller.obtenerDatosPregunta("5")),
            ],
          )),
    );
  }
}
