import 'package:flutter/material.dart';

class FechaInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Fecha de nacimiento'.toUpperCase(),
        ),
      ),
    );
  }
}
