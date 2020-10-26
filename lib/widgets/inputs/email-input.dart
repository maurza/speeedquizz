import 'package:flutter/material.dart';
import 'package:speedquizz/extras/validators.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const EmailInput({Key key, this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: emailController,
        validator: validators.validateEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Correo'.toUpperCase(),
        ),
      ),
    );
  }
}
