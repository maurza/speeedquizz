import 'package:flutter/material.dart';
import 'package:speedquizz/models/pregunta.dart';

class MultiSelect extends StatefulWidget {
  final Pregunta pregunta;

  const MultiSelect({Key key, this.pregunta}) : super(key: key);
  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
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
            shrinkWrap: true, children: List.generate(4, (index) => _Option()))
      ],
    );
  }
}

class _Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Container(child: Text("A")), Text("Hola")],
      ),
    );
  }
}
