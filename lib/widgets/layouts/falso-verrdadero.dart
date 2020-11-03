import 'package:flutter/material.dart';
import 'package:speedquizz/models/pregunta.dart';

import '../../extras/colores.dart';
import '../../extras/colores.dart';
import '../../extras/colores.dart';
import '../../extras/dimens.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 50, height: 50),
            Text(widget.pregunta.enunciado)
          ],
        ),
        ListView(
            shrinkWrap: true,
            children: List.generate(
                widget.pregunta.opciones.length,
                (index) => InkWell(
                      onTap: () {
                        showAnswer(index);
                      },
                      child: _Option(
                        opciones: widget.pregunta.opciones[index],
                        index: index,
                        showcolor: showing == index,
                      ),
                    )))
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
              child: Text(construirletra(index))),
          Text(opciones.contenido)
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
