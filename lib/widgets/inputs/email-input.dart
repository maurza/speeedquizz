import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const EmailInput({Key key, this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Correo'.toUpperCase(),
        ),
      ),
    );
  }
}
