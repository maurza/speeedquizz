import 'package:flutter/material.dart';

class CarreraInput extends StatelessWidget {
  final TextEditingController carreraController;

  const CarreraInput({Key key, this.carreraController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: carreraController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Carrera'.toUpperCase(),
        ),
      ),
    );
  }
}
