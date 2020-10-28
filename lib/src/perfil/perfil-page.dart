import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import './perfil-controller.dart';

class PerfilPage extends StatefulWidget {
  static const route = 'perfil';
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends StateMVC<PerfilPage> {
  _PerfilPageState() : super(PerfilController()) {
    controller = PerfilController.con;
  }

  PerfilController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.pageName)),
      body: Container(
        child: Center(
          child: Text(controller.pageName),
        ),
      ),
    );
  }
}
