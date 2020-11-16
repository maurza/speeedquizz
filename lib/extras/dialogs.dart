import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => Container(
        alignment: Alignment.center, child: CircularProgressIndicator()),
  );
}

hideLoadingDialog(BuildContext context) => Navigator.pop(context);
