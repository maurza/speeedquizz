import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speedquizz/extras/styles.dart';

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
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ))))))
              .toList()),
      Wrap(
          children: tagList
              .where((element) => !element.pending)
              .map((item) => Container(
                  margin: dimens.fromLTRB(context, 0, 0, .02, .02),
                  child: InkWell(
                      onTap: () => print("Hola"),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: dimens.borderRadiusContainer(10)),
                          padding: dimens.all(context, .02),
                          child: Text(
                            item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color:
                                    !item.pending ? Colors.grey : Colors.black),
                          )))))
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
          onClick: () => widget.validate(true),
        )
    ]));
  }

  _colorItem(_Item item) {
    if (item == itemSelected1 || item == itemSelected2) {
      return Colors.blue;
    } else if (!item.pending) {
      return Colors.grey.withOpacity(.1);
    } else {
      return Colors.white.withOpacity(.2);
    }
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
