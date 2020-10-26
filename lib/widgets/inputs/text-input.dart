import 'package:flutter/material.dart';
import 'package:speedquizz/extras/validators.dart';

class TextInput extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool isRequired;
  const TextInput(
      {Key key, this.textController, this.labelText, this.isRequired = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textController,
        validator: isRequired ? validators.validateText : null,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
        ),
      ),
    );
  }
}
