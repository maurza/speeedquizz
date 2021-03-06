import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/user-provider.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';

class FalsoVerdadero extends StatefulWidget {
  final Pregunta pregunta;
  final Function validate;

  const FalsoVerdadero({Key key, this.pregunta, this.validate})
      : super(key: key);
  @override
  _FalsoVerdaderoState createState() => _FalsoVerdaderoState();
}

class _FalsoVerdaderoState extends State<FalsoVerdadero> {
  int showing = -1;
  showAnswer(int index) {
    showing = index;
    setState(() {});
    Future.delayed(Duration(seconds: 5), () {
      showing = -1;
      setState(() {});
    });
  }

  showDialogAnswer(answer) {
    bool correcta = answer == 0 ? false : true;

    String mensaje =
        correcta ? "La respuesta es correcta!" : "La respuesta es incorrecta";

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text(mensaje),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )).then((value) => widget.validate(correcta));
  }

  asignarPuntaje(answer) {
    bool correcto = answer == 0 ? false : true;

    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    int puntajeActual = provider.puntaje;
    int _puntajePregunta = correcto
        ? widget.pregunta.costos[0].puntosAcierto
        : widget.pregunta.costos[0].puntosFracaso;
    puntajeActual = _puntajePregunta + puntajeActual;
    provider.puntaje = puntajeActual >= 0 ? puntajeActual : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: dimens.symetric(context, .03, .05),
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/images/quizz1.png"),
              ),
              Expanded(
                  child: Text(
                widget.pregunta.enunciado,
                style: styles.large(context),
              ))
            ],
          ),
        ),
        Expanded(
          child: ListView(
              shrinkWrap: true,
              children: List.generate(
                  widget.pregunta.opciones.length,
                  (index) => InkWell(
                        onTap: () {
                          showAnswer(index);
                          asignarPuntaje(
                              widget.pregunta.opciones[index].correcta);
                          showDialogAnswer(
                              widget.pregunta.opciones[index].correcta);
                        },
                        child: _Option(
                          opciones: widget.pregunta.opciones[index],
                          index: index,
                          showcolor: showing == index,
                        ),
                      ))),
        )
      ],
    );
  }
}

class _Option extends StatelessWidget {
  final Opciones opciones;
  final int index;
  final bool showcolor;
  const _Option({Key key, this.opciones, this.index, this.showcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: dimens.symetric(context, .05, .01),
      decoration: BoxDecoration(
        borderRadius: dimens.borderRadiusContainer(15),
        color: construircolor(showcolor),
      ),
      child: Row(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: dimens.borderRadiusContainer(15),
                color: construircolor(showcolor),
              ),
              padding: dimens.symetric(context, .05, .05),
              margin: dimens.horizontal(context, .05),
              child: Text(
                construirletra(index),
                style: styles.regular(context),
              )),
          Expanded(
              child: Text(
            opciones.contenido,
            style: styles.regular(context),
          ))
        ],
      ),
    );
  }

  construirletra(int index) {
    switch (index) {
      case 0:
        return "A. ";
        break;
      case 1:
        return "B. ";
        break;
      case 2:
        return "C. ";
        break;
      case 3:
        return "D. ";
        break;
      case 4:
        return "E. ";
        break;
      case 5:
        return "F. ";
        break;
      default:
        return "";
    }
  }

  construircolor(bool mostrarcolor) {
    if (mostrarcolor) {
      if (opciones.correcta == 0) {
        return colores.rojooscuro;
      } else {
        return colores.verde;
      }
    } else {
      return colores.blanco;
    }
  }
}
