import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import './lobby-controller.dart';

class LobbyPage extends StatefulWidget {
  static const route = 'lobby';
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends StateMVC<LobbyPage> {
  _LobbyPageState() : super(LobbyController()) {
    controller = LobbyController.con;
  }

  LobbyController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Bienvenido"),
          IconButton(
              icon: Icon(Icons.supervised_user_circle_rounded,
                  color: Colors.white),
              onPressed: () {
                controller.irAlPerfil();
              }),
        ],
      )),
      body: Container(
        child: Center(
          child: Text(controller.pageName),
        ),
      ),
    );
  }
}
