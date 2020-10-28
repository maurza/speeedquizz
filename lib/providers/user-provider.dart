import 'package:flutter/material.dart';
import 'package:speedquizz/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }
}
