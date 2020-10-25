import 'package:flutter/material.dart';

class NombreInput extends StatelessWidget {
  final TextEditingController nombreController;

  const NombreInput({Key key, this.nombreController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: nombreController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Nombre'.toUpperCase(),
        ),
      ),
    );
  }
}
