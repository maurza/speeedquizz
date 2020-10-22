import 'package:flutter/material.dart';

class NicknameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Nickname'.toUpperCase(),
        ),
      ),
    );
  }
}
