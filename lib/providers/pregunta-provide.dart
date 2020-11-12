import 'package:flutter/material.dart';

class PreguntaProvider extends ChangeNotifier {
  List _opcionesCorrectas = [];

  List get opcionesCorrectas => _opcionesCorrectas;

  set opcionesCorrectas(List opcionesCorrectas) {
    _opcionesCorrectas = opcionesCorrectas;
    notifyListeners();
  }
}
