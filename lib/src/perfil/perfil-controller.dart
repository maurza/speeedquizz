import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:speedquizz/models/user.dart';
import 'package:speedquizz/providers/user-provider.dart';
import 'package:http/http.dart' as http;
import 'package:speedquizz/src/lobby/lobby-page.dart';

class PerfilController extends ControllerMVC {
  factory PerfilController() {
    _this = PerfilController._();
    return _this;
  }
  static PerfilController _this;

  PerfilController._();

  static PerfilController get con => _this;

  String pageName = 'Editar Perfil';

  BuildContext context;
  DateTime bornDate;

  User user;

  get emailController => null;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
      print(Provider.of<UserProvider>(context, listen: false).user.toJson());
      user = User.fromJson(
          Provider.of<UserProvider>(context, listen: false).user.toJson());

      emailControllers.text = user.correo;
      carreraController.text = user.carrera;
      institucionController.text = user.institucion;
      nickNameController.text = user.nickname;
      nombreController.text = user.nombre;
    });
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailControllers = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController institucionController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController nombreController = TextEditingController();

  onDateAccept(DateTime dateTime) {
    bornDate = dateTime;
    setState(() {});
  }

  fechaInputValue() {
    if (bornDate == null) {
      return 'Fecha de nacimiento';
    } else {
      return DateFormat.yMMMMd('es').format(bornDate);
    }
  }

  actualizarInfo() async {
    final String apiUrl =
        "https://speedquiz-services.herokuapp.com/" + user.correo;

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    final jasonReq = {
      "nombre": nombreController.text,
      "nickName": nickNameController.text,
      "correo": emailControllers.text,
      "fechaNacimiento": bornDate.toString(),
      "institucion": institucionController.text,
      "carrera": carreraController.text
    };

    final userInsert = {
      "nombre": nombreController.text,
      "nickname": nickNameController.text,
      "correo": emailControllers.text,
      "fechaNacimiento": bornDate.toString(),
      "institucion": institucionController.text,
      "carrera": carreraController.text,
      "idUsuario:": user.idUsuario,
      "Tip_id_TipoLogin": user.tipIdTipoLogin,
      "password": user.password,
      "icono": user.icono,
      "puntuacion": user.puntuacion,
      "Li_id_Liga": user.liIdLiga,
      "Est_id_estado": user.estIdEstado
    };

    final msg = jsonEncode(jasonReq);

    final response = await http.put(apiUrl, headers: requestHeaders, body: msg);

    final responseToJson = jsonDecode(response.body);

    if (responseToJson['state'] == "changed") {
      Provider.of<UserProvider>(context, listen: false).user =
          User.fromJson(userInsert);
      Navigator.pushReplacementNamed(context, LobbyPage.route);
    } else {
      showTyCDialog();
    }
  }

  showTyCDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text("Verifique todos los campos"),
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