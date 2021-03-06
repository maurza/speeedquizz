import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'package:speedquizz/src/perfil/perfil-page.dart';
import 'package:speedquizz/src/quizz/quizz-page.dart';

import '../../providers/pregunta-provide.dart';

class LobbyController extends ControllerMVC {
  factory LobbyController() {
    _this = LobbyController._();
    return _this;
  }
  static LobbyController _this;

  LobbyController._();

  static LobbyController get con => _this;

  String pageName = 'Lobby';
  BuildContext context;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;

      setState(() {});
    });
    super.initState();
  }

  irAlPerfil() {
    Navigator.pushNamed(context, PerfilPage.route);
  }

  irAlQuizz(String tipoPregunta, Pregunta pregunta) {
    Provider.of<PreguntaProvider>(context, listen: false).opcionesCorrectas =
        [];
    Navigator.pushNamed(context, QuizzPage.route,
        arguments: {"type": tipoPregunta, "pregunta": pregunta});
  }

  obtenerDatosPregunta(String tipoPregunta) {
    irAlQuizz(tipoPregunta, null);
  }
}
