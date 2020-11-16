import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:speedquizz/extras/dialogs.dart';
import 'dart:convert';

import 'package:speedquizz/models/user.dart';

import '../../providers/user-provider.dart';

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

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
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
    final String apiUrl = "https://speedquiz-services.herokuapp.com/agregar";

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    if (nombreController.text != "" &&
        nickNameController.text != "" &&
        emailController.text != "") {
      final msg = jsonEncode(user.toJson());

      print(msg);

      showLoadingDialog(context);
      final response = await http
          .post(apiUrl, headers: requestHeaders, body: msg)
          .catchError((e) => print(e));
      hideLoadingDialog(context);
      print(response.body);

      if (json.decode(response.body) == "respusido") {
        Provider.of<UserProvider>(context, listen: false).user = user;
        goToOnboarding();
      } else {
        setState(() {
          failedRegistro = true;
        });
      }
    } else {
      showCamposDialog("Ingrese los campos que son obligatorios");
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
        if (passwordController.text == passwordController1.text) {
          createClassUser();
          singup(context);
        } else {
          showCamposDialog("Las contraseñas deben coincidir");
        }
      }
    } else {
      showCamposDialog(
          "Para registrarse por favor aceptar terminos y condiciones");
    }
  }

  goToOnboarding() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/onboarding', (Route<dynamic> route) => false);
  }

  /// Se crea una clase tipo user  con todos los datos  obtenidoos
  ///para manejar mejor todos los datos
  createClassUser() {
    user = User.fromJson({
      "nombre": nombreController.text,
      "nickname": nickNameController.text,
      "correo": emailController.text,
      "institucion": institucionController.text,
      "carrera": carreraController.text,
      "fecha_nacimiento": fechaInputValue(),
      "password": passwordController.text
    });
    setState(() {});
  }

  /// Si la fecha es null se retorrna un label con el nombre del campo
  /// de lo contrio, se retorna la fecha formateada
  fechaInputValue() {
    if (bornDate == null) {
      return 'Fecha de nacimiento';
    } else {
      return DateFormat('y-M-d', 'es').format(bornDate);
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

  /// Si no han aceptado los terminos y condicciones no pueden avanzar y si tiene campos nulos

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
