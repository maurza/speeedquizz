import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/validators.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController passwordController;
  final String labelText;

  const PasswordInput({Key key, this.passwordController, this.labelText})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validators.validatePassword,
        controller: widget.passwordController,
        keyboardType: TextInputType.text,
        obscureText: showPassword,
        decoration: InputDecoration(
            labelText: widget.labelText.toUpperCase(),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                showPassword = !showPassword;
              }),
              icon:
                  Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            )),
      ),
    );
  }
}
