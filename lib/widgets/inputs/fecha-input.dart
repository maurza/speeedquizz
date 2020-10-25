import 'package:flutter/material.dart';

class FechaInput extends StatelessWidget {
  final TextEditingController fechaController;

  const FechaInput({Key key, this.fechaController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: fechaController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Fecha de nacimiento'.toUpperCase(),
        ),
      ),
    );
  }
}
