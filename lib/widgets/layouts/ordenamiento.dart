import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/pregunta.dart';
import 'package:speedquizz/providers/pregunta-provide.dart';
import 'package:speedquizz/services/quizz-service.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';

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
      opciones = widget.pregunta.opciones;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.pregunta.enunciado),
      Expanded(
        child: ReorderableListView(
            children: [
              for (var item in opciones)
                ListTile(key: ValueKey(item), title: Text((item)))
            ],
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > opciones.length) newIndex = opciones.length;
                if (oldIndex < newIndex) newIndex--;

                String item = opciones[oldIndex];
                opciones.remove(item);
                opciones.insert(newIndex, item);
              });
            }),
      ),
      RounderButton(
          buttonBorderColor: Hexcolor('#94D9D4').withOpacity(0.7),
          buttonColor: Hexcolor('#94D9D4'),
          buttonText: 'Ingresar',
          onClick: () => validarRespuestas())
    ]);
  }

  validarRespuestas() {
    List correctas =
        Provider.of<PreguntaProvider>(context, listen: false).opcionesCorrectas;
    showDialogAnswer(correctas == opciones);
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
