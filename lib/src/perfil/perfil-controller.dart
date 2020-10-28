import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/providers/user-provider.dart';

class PerfilController extends ControllerMVC {
  factory PerfilController() {
    _this = PerfilController._();
    return _this;
  }
  static PerfilController _this;

  PerfilController._();

  static PerfilController get con => _this;

  String pageName = 'Perfil';

  BuildContext context;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
      print(Provider.of<UserProvider>(context, listen: false).user.toJson());
    });
    super.initState();
  }
}
