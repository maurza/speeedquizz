
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import './categorias-controller.dart';


class CategoriasPage extends StatefulWidget {
  static const route = '/Categorias';
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends StateMVC<CategoriasPage> {
  _CategoriasPageState() : super(CategoriasController()) {
    controller = CategoriasController.con;
  }

  CategoriasController controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(controller.pageName)),
      body: Container(
        child: Center(
          child: Text(controller.pageName+ ""),
        ),
      ),
    );
    
  }
}
        