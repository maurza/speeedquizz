import 'package:flutter/material.dart';

class CarreraInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Carrera'.toUpperCase(),
        ),
      ),
    );
  }
}
