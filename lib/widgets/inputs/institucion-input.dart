import 'package:flutter/material.dart';

class InstitucionInput extends StatelessWidget {
  final TextEditingController institucionController;

  const InstitucionInput({Key key, this.institucionController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: institucionController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Institución'.toUpperCase(),
        ),
      ),
    );
  }
}
