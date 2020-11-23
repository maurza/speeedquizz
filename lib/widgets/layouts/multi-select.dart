import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';

class MultiSelect extends StatefulWidget {
  final Pregunta pregunta;
  final Function validate;

  const MultiSelect({Key key, this.pregunta, this.validate}) : super(key: key);
  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  int showing = -1;
  List<Opciones> opcionesSeleccionadas = [];
  seleccionarOpcion(opcion) {
    if (seleccionada(opcion)) {
      opcionesSeleccionadas
          .removeWhere((element) => element.contenido == opcion.contenido);
    } else {
      print(opcion.toJson());
      opcionesSeleccionadas.add(opcion);
    }
    setState(() {});
  }

  seleccionada(opcion) {
    List coincidencias = opcionesSeleccionadas
        .where((element) => element.contenido == opcion.contenido)
        .toList();
    return coincidencias.length > 0;
  }

  validarSelecionada() {
    List coincidencias = opcionesSeleccionadas
        .where((element) => element.correcta == 0)
        .toList();
    print(coincidencias.length);
    return coincidencias.length == 0;
  }

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
                          print(widget.pregunta.opciones[index].toJson());
                          seleccionarOpcion(widget.pregunta.opciones[index]);
                          //showAnswer(index);
                          //showDialogAnswer(
                          //  widget.pregunta.opciones[index].correcta);
                        },
                        child: _Option(
                          opciones: widget.pregunta.opciones[index],
                          index: index,
                          showcolor: showing == index,
                          seleccionado:
                              seleccionada(widget.pregunta.opciones[index]),
                        ),
                      ))),
        ),
        Container(
            margin: dimens.horizontal(context, .05),
            child: RounderButton(
                radius: 20.0,
                buttonBorderColor: Hexcolor('#94D9D4').withOpacity(0.7),
                buttonColor: Hexcolor('#94D9D4'),
                buttonText: 'Validar',
                onClick: () {
                  print(validarSelecionada());
                }))
      ],
    );
  }
}

class _Option extends StatelessWidget {
  final Opciones opciones;
  final int index;
  final bool showcolor;
  final bool seleccionado;
  const _Option(
      {Key key, this.opciones, this.index, this.showcolor, this.seleccionado})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: dimens.symetric(context, .05, .01),
      decoration: BoxDecoration(
        borderRadius: dimens.borderRadiusContainer(15),
        color: construircolor(showcolor, seleccionado),
      ),
      child: Row(
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: dimens.borderRadiusContainer(15),
                color: construircolor(showcolor, seleccionado),
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

  construircolor(bool mostrarcolor, bool seleccionado) {
    if (mostrarcolor) {
      if (opciones.correcta == 0) {
        return colores.rojooscuro;
      } else {
        return colores.verde;
      }
    } else {
      if (seleccionado) {
        return colores.grisclaro;
      } else {
        return colores.blanco;
      }
    }
  }
}
