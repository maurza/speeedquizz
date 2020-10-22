import 'package:flutter/material.dart';

class NombreInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Nombre'.toUpperCase(),
        ),
      ),
    );
  }
}
