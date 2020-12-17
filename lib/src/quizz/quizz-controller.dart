import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/constants.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

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
      UserProvider provider = Provider.of<UserProvider>(context, listen: false);
      provider.puntaje = 0;

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
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
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
            title: Column(children: [
              Image(
                  image: AssetImage("assets/images/nursing.png"),
                  height: 150.0),
              Text('Finalizaste Exitosamente'),
              Text('TU PUNTUACIÓN FUÉ: ' + provider.puntaje.toString()),
            ]),
            content: Text(''),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'ACEPTAR',
                  style: TextStyle(color: colores.purpuracards),
                ),
                onPressed: () {
                  actualizarPuntajeBack(provider.puntaje, provider.user.correo);

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

  Future actualizarPuntajeBack(int puntaje, String correo) async {
    //Header
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    //body
    final puntNuevo = {"puntaje": puntaje};
    final msg = jsonEncode(puntNuevo);

    http.Response response = await http
        .put(Constants().url + "cambioPuntaje/" + correo,
            headers: requestHeaders, body: msg)
        .catchError((e) => print(e));
    return json.decode(response.body);
  }

  mostrarAyuda(BuildContext context, String ayuda) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    int valorAyuda = preguntas[preguntaActual].costos[0].costoAyuda;
    int nuevoPuntaje = provider.puntaje - valorAyuda;
    provider.puntaje = nuevoPuntaje >= 0 ? nuevoPuntaje : 0;
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

  confirmarAyuda(BuildContext context, String ayuda) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: dimens.borderRadius(10.0),
          content: Text('Si usas la ayuda obtendrás la mitad de los puntos'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'CANCELAR',
                style: TextStyle(color: colores.purpuracards),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'ACEPTAR',
                style: TextStyle(color: colores.purpuracards),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                mostrarAyuda(context, ayuda);
              },
            ),
          ],
        );
      },
    );
  }

  String pageName = 'Quizz';
}
