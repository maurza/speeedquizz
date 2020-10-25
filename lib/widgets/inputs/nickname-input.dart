import 'package:flutter/material.dart';

class NicknameInput extends StatelessWidget {
  final TextEditingController nickNameController;

  const NicknameInput({Key key, this.nickNameController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: nickNameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Nickname'.toUpperCase(),
        ),
      ),
    );
  }
}
