import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';
import '../../extras/dimens.dart';
import '../../extras/styles.dart';

class Ordenamiento extends StatefulWidget {
  final Pregunta pregunta;

  const Ordenamiento({Key key, this.pregunta}) : super(key: key);
  @override
  _OrdenamientoState createState() => _OrdenamientoState();
}

class _OrdenamientoState extends State<Ordenamiento> {
  List opciones = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      opciones = shuffle([...widget.pregunta.opciones]);
      setState(() {});
    });
    super.initState();
  }

  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: dimens.all(context, .05),
        child: Text(
          widget.pregunta.enunciado,
          style: styles.largeBold(context),
        ),
      ),
      Expanded(
        child: ReorderableListView(
            children: [
              for (var item in opciones)
                ListTile(
                    key: ValueKey(item),
                    title: _ItemList(
                      opcion: item,
                    ))
            ],
            onReorder: (oldIndex, newIndex) {
              setState(() {
                opciones = reorderList(oldIndex, newIndex, [...opciones]);
              });
            }),
      ),
      Container(
          margin: dimens.horizontal(context, .05),
          child: RounderButton(
              radius: 20.0,
              buttonBorderColor: Hexcolor('#94D9D4').withOpacity(0.7),
              buttonColor: Hexcolor('#94D9D4'),
              buttonText: 'Validar',
              onClick: () => validarRespuestas()))
    ]);
  }

  validarRespuestas() {
    List correctas =
        Provider.of<PreguntaProvider>(context, listen: false).opcionesCorrectas;

    showDialogAnswer(correctas.join() == opciones.join());
  }

  showDialogAnswer(correcta) {
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
}

reorderList(oldIndex, newIndex, options) {
  if (newIndex > options.length) newIndex = options.length;
  if (oldIndex < newIndex) newIndex--;

  String item = options[oldIndex];
  options.remove(item);
  options.insert(newIndex, item);
  return options;
}

class _ItemList extends StatelessWidget {
  final String opcion;

  const _ItemList({Key key, this.opcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dimens.all(context, .05),
      decoration: BoxDecoration(
          color: colores.blanco.withOpacity(.4),
          borderRadius: dimens.borderRadiusContainer(15)),
      child: Text(
        opcion,
        style: styles.largeBold(context),
      ),
    );
  }
}
