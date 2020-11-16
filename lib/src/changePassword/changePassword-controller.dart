import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/dialogs.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'package:http/http.dart' as http;
import 'package:speedquizz/src/lobby/lobby-page.dart';
import 'package:toast/toast.dart';

class ChangePasswordController extends ControllerMVC {
  factory ChangePasswordController() {
    _this = ChangePasswordController._();
    return _this;
  }

  static ChangePasswordController _this;

  TextEditingController passwordControllerVieja = TextEditingController();
  TextEditingController passwordControllerNueva1 = TextEditingController();
  TextEditingController passwordControllerNueva2 = TextEditingController();

  ChangePasswordController._();

  static ChangePasswordController get con => _this;

  String pageName = 'ChangePassword';
  BuildContext context;
  User user;

  get emailController => null;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
      print(Provider.of<UserProvider>(context, listen: false).user.toJson());
      user = User.fromJson(
          Provider.of<UserProvider>(context, listen: false).user.toJson());
    });
    super.initState();
  }

  cambiarPassword() async {
    final String apiUrl =
        "https://speedquiz-services.herokuapp.com/cambioContra/" + user.correo;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final passNueva = {"password": passwordControllerNueva1.text};
    final msg = jsonEncode(passNueva);

    if (user.password == passwordControllerVieja.text) {
      if (validarCampos(
          passwordControllerNueva1.text, passwordControllerNueva2.text)) {
        showLoadingDialog(context);
        final response =
            await http.put(apiUrl, headers: requestHeaders, body: msg);
        hideLoadingDialog(context);

        if (jsonDecode(response.body)['state'] == "changed") {
          final userInsert = {
            "nombre": user.nombre,
            "nickname": user.nickname,
            "correo": user.correo,
            "fecha_nacimiento": user.fecha_nacimiento,
            "institucion": user.institucion,
            "carrera": user.carrera,
            "idUsuario:": user.idUsuario,
            "Tip_id_TipoLogin": user.tipIdTipoLogin,
            "password": passwordControllerNueva2.text,
            "icono": user.icono,
            "puntuacion": user.puntuacion,
            "Li_id_Liga": user.liIdLiga,
            "Est_id_estado": user.estIdEstado
          };

          /// Se actualizan los dator del usuario
          Provider.of<UserProvider>(context, listen: false).user =
              User.fromJson(userInsert);

          /// Se muestra aleta de confirmacion
          Toast.show("Contraseña actualizada!", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

          Future.delayed(Duration(seconds: 1), () {
            /// Se retorna al Lobby
            Navigator.pushReplacementNamed(context, LobbyPage.route);
          });
        } else {
          showCamposDialog("No se pudieron Actualizar Revisa los campos");
        }
      } else {
        showCamposDialog("Las dos contraseñas NO coinciden");
      }
    } else {
      showCamposDialog("La contraseña antigua NO es la correcta");
    }
  }

  validarCampos(String uno, String dos) {
    if (uno == dos) {
      return true;
    } else
      return false;
  }

  showCamposDialog(String mensaje) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text(mensaje),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
