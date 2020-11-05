import 'package:flutter/material.dart';
import 'package:speedquizz/extras/validators.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final String labelText;

  const PasswordInput({Key key, this.passwordController, this.labelText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validators.validatePassword,
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
      ),
    );
  }
}
