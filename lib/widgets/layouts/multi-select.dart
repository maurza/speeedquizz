import 'package:flutter/material.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/pregunta.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';

class MultiSelect extends StatefulWidget {
  final Pregunta pregunta;

  const MultiSelect({Key key, this.pregunta}) : super(key: key);
  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
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
            ));
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
      margin: dimens.all(context, .02),
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
              padding: dimens.all(context, .1),
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
