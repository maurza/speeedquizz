import 'package:flutter/material.dart';

class PreguntaProvider extends ChangeNotifier {
  List _opcionesCorrectas = [];

  List get opcionesCorrectas => _opcionesCorrectas;

  set opcionesCorrectas(List opcionesCorrectas) {
    if (_opcionesCorrectas.length == 0) {
      _opcionesCorrectas = opcionesCorrectas;
      notifyListeners();
    }
    if (opcionesCorrectas.length == 0) {
      _opcionesCorrectas = opcionesCorrectas;
      notifyListeners();
    }
  }
}
