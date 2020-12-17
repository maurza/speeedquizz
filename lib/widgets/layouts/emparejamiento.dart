import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/styles.dart';
import 'package:speedquizz/providers/user-provider.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../models/pregunta.dart';
import '../buttons/rounder-button.dart';

class Emparejamiento extends StatefulWidget {
  final Pregunta pregunta;
  final Function validate;

  const Emparejamiento({Key key, this.pregunta, this.validate})
      : super(key: key);

  @override
  _EmparejamientoState createState() => _EmparejamientoState();
}

class _EmparejamientoState extends State<Emparejamiento> {
  List<_Item> tagList = [];

  _Item itemSelected1;
  _Item itemSelected2;
  int intentosFallidos = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      tagList = [...widget.pregunta.opciones]
          .map(
            (e) => _Item(name: e.contenido, match: e.correcta, pending: true),
          )
          .toList();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
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
      Wrap(
          children: tagList
              .map((item) => Opacity(
                  opacity: item.pending ? 1 : .2,
                  child: Container(
                      margin: dimens.fromLTRB(context, 0, 0, .02, .02),
                      child: InkWell(
                          onTap: () => onSelectItem(item),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: _colorItem(item),
                                  borderRadius:
                                      dimens.borderRadiusContainer(10)),
                              padding: dimens.all(context, .02),
                              child: Text(
                                item.name,
                                style: styles.largeBold(context),
                              ))))))
              .toList()),
      Expanded(
        child: Container(),
      ),
      if (monstrarBotonContinuar())
        RounderButton(
            radius: 20.0,
            buttonBorderColor: Hexcolor('#94D9D4').withOpacity(0.7),
            buttonColor: Hexcolor('#94D9D4'),
            buttonText: 'Continuar',
            onClick: () {
              asignarPuntaje(1);
              widget.validate(true);
            })
    ]));
  }

  _colorItem(_Item item) {
    if (item == itemSelected1 || item == itemSelected2) {
      return Colors.blue;
    } else if (!item.pending) {
      return Colors.grey.withOpacity(.1);
    } else {
      return Colors.white;
    }
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

  onSelectItem(_Item _item) {
    if (_item.pending) {
      if (itemSelected1 == null) {
        itemSelected1 = _item;
        setState(() {});
      } else if (itemSelected2 == null) {
        if (_item != itemSelected1) {
          itemSelected2 = _item;
          setState(() {});
          validateSelectedItems();
        }
      } else {
        validateSelectedItems();
      }
    }
  }

  validateSelectedItems() {
    if (itemSelected1.match == itemSelected2.match) {
      tagList = [...tagList]
          .map((element) => _Item(
              name: element.name,
              match: element.match,
              pending: (element.match == itemSelected1.match ||
                      element.match == itemSelected2.match ||
                      !element.pending)
                  ? false
                  : true))
          .toList();

      setState(() {});
    } else {
      intentosFallidos += 1;
      if (intentosFallidos == 2) {
        asignarPuntaje(0);
        showDialogAnswer();
      }
    }
    itemSelected1 = null;
    itemSelected2 = null;

    setState(() {});
  }

  monstrarBotonContinuar() {
    List pendientes =
        tagList.where((element) => element.pending == true).toList();

    return pendientes.length == 0;
  }

  showDialogAnswer() {
    String mensaje = "La respuesta es incorrecta";

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
            )).then((value) => widget.validate(false));
  }
}

class _Item {
  /// Titulo opción
  String name;

  /// valor con el que se emparejará
  num match;

  /// Valida si ya se emparejó o no
  bool pending;

  _Item({this.name, this.match, this.pending});
}
