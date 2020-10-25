import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordInput({Key key, this.passwordController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Contraseña'.toUpperCase(),
        ),
      ),
    );
  }
}
