import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speedquizz/models/user.dart';

class SingupController extends ControllerMVC {
  factory SingupController() {
    _this = SingupController._();
    return _this;
  }
  static SingupController _this;

  SingupController._();

  static SingupController get con => _this;

  BuildContext context;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
    });
  }

///// Metodos de aca een adelanteeeeeee
  ///
  ///
  ///
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController institucionController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  DateTime bornDate;

  /// Aceptó terminos y condiciones?
  bool tycAcepted = false;

  ///datos del usuario obtenidos en el formularioo
  User user;
  bool failedRegistro = false;
  String saludo = "Hola";

  singup(context) async {
    print(nickNameController.text);

    final String apiUrl = "https://speedquiz-services.herokuapp.com/agregar";

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    /// TODO:  para volver los json una entidad
    /// recomiendo la pagina
    /// https://javiercbk.github.io/json_to_dart/
    final msg = jsonEncode(user.toJson());

    final response =
        await http.post(apiUrl, headers: requestHeaders, body: msg);
    print(response.body);

    if (json.decode(response.body) == "respusido") {
      goToWelcome();
    } else {
      setState(() {
        failedRegistro = true;
      });
    }
  }

  returnLogin(context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  ///Valida formulario
  validateForm(context) {
    /// SI los  teerminos fueron aceptados, se continua con la valiidaciioon de  form
    ///de lo contrrario se muestra un mensaje
    if (tycAcepted) {
      if (formKey.currentState.validate()) {
        createClassUser();
        goToWelcome();
        //singup(context);
      }
    } else {
      showTyCDialog();
    }
  }

  goToWelcome() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/welcome', (Route<dynamic> route) => false,
        arguments: user);
  }

  /// Se crea una clase tipo user  con todos los datos  obtenidoos
  ///para manejar mejor todos los datos
  createClassUser() {
    user = User.fromJson({
      "nombre": nombreController.text,
      "nickName": nickNameController.text,
      "correo": emailController.text,
      "institucion": institucionController.text,
      "carrera": carreraController.text,
      "fechaNacimiento": "1992-02-20",
      "contrasena": passwordController.text
    });
    setState(() {});
  }

  /// Si la fecha es null se retorrna un label con el nombre del campo
  /// de lo contrio, se retorna la fecha formateada
  fechaInputValue() {
    if (bornDate == null) {
      return 'Fecha de nacimiento';
    } else {
      return DateFormat.yMMMMd('es').format(bornDate);
    }
  }

  /// Cuando en nput de fecha le dan aceptar obtine la data
  onDateAccept(DateTime dateTime) {
    bornDate = dateTime;
    setState(() {});
  }

  /// cuando se actualice el check de terminos
  onTyCUpdate() {
    tycAcepted = !tycAcepted;
    setState(() {});
  }

  /// Si no han aceptado los terminos y condicciones no pueden avanzar
  showTyCDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text(
                  "Para registrarse por favor aceptar terminos y condiciones"),
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
