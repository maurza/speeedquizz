import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/providers/user-provider.dart';
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
      body: SafeArea(
        child: Container(
          width: dimens.fullWidth(context),
          child: Stack(children: [_options(), _appbar()]),
        ),
      ),
    );
  }

  _appbar() {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    return Container(
        padding: dimens.horizontal(context, .03),
        height: dimens.fullWidth(context) * .2,
        child: Row(children: [
          InkWell(
            onTap: () => controller.irAlPerfil(),
            child: Container(
                margin: dimens.right(context, 0.03),
                padding: dimens.all(context, 0.02),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colores.purpuracards),
                child: Image.asset("assets/images/card1.png")),
          ),
          Text(
            'Hola\n${user.nombre}!',
            style: styles.largeBold(context),
          ),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/images/logoSpeedQuizz.png",
                    width: dimens.fullWidth(context) * .2,
                  )))
        ]));
  }

  _options() {
    return Column(
      children: [
        Container(
          height: dimens.fullWidth(context) * .25,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: colores.grisclaro.withOpacity(.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView(
              shrinkWrap: true,
              padding: dimens.all(context, .03),
              children: [
                SimpleCard(
                    color: colores.verdecards,
                    texto: "Fácil/Sel. Multiple",
                    imagepath: "assets/images/card2.png",
                    onClick: () => controller.obtenerDatosPregunta("1")),
                SimpleCard(
                    color: colores.amarillocards,
                    texto: "Medio/Sel. Multiple",
                    imagepath: "assets/images/card1.png",
                    onClick: () => controller.obtenerDatosPregunta("2")),
                SimpleCard(
                    color: colores.rojocards,
                    texto: "Difícil/F y V",
                    imagepath: "assets/images/suero.png",
                    onClick: () => controller.obtenerDatosPregunta("3")),
                SimpleCard(
                    color: colores.azulcards,
                    texto: "Aleatorio/ordenar",
                    imagepath: "assets/images/ambu.png",
                    onClick: () => controller.obtenerDatosPregunta("5")),
                /*
                SimpleCard(
                    color: colores.purpuracards,
                    texto: "Ordenar",
                    imagepath: "assets/images/card5.png",
                    onClick: () => controller.obtenerDatosPregunta("5")),*/
              ],
            ),
          ),
        ),
      ],
    );
  }
}
