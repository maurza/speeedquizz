import 'package:flutter/material.dart';
import 'package:speedquizz/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user;
  int _puntaje = 0;
  bool _usoAyuda = false;

  bool get usoAyuda => _usoAyuda;

  set usoAyuda(bool usoAyuda) {
    _usoAyuda = usoAyuda;
    notifyListeners();
  }

  int get puntaje => _puntaje;

  set puntaje(int puntaje) {
    _puntaje = puntaje;

    notifyListeners();
  }

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }
}
