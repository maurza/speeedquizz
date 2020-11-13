import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';
import 'package:speedquizz/widgets/inputs/password-input.dart';
import './changePassword-controller.dart';

class ChangePasswordPage extends StatefulWidget {
  static const route = '/ChangePassword';
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends StateMVC<ChangePasswordPage> {
  _ChangePasswordPageState() : super(ChangePasswordController()) {
    controller = ChangePasswordController.con;
  }

  ChangePasswordController controller;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardClose = (MediaQuery.of(context).viewInsets.bottom == 0.0);

    return Scaffold(
      appBar: AppBar(title: Text(controller.pageName)),
      body: Stack(
        children: [
          AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: isKeyboardClose ? 1 : 0,
              child: Image.asset(paths.registro)),
          SafeArea(
            child: Container(
              child: ListView(
                padding: dimens.all(context, .1),
                physics: ScrollPhysics(),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: dimens.bottom(context, .05),
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          paths.paso1,
                          width: dimens.fullWidth(context) * 0.32,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Todos los datos marcados con * son obligatorios"),
                        PasswordInput(
                          passwordController:
                              controller.passwordControllerVieja,
                          labelText: 'Contraseña Actual *',
                        ),
                        PasswordInput(
                          passwordController:
                              controller.passwordControllerNueva1,
                          labelText: 'Nueva Contraseña *',
                        ),
                        PasswordInput(
                          passwordController:
                              controller.passwordControllerNueva2,
                          labelText: 'Confirmar Contraseña *',
                        ),
                        Text("Asegurese de recordar la nueva contraseña"),
                        changePasswordButton(controller)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget changePasswordButton(ChangePasswordController controller) {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      controller.cambiarPassword();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/images/candado.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '       Guardar cambios        ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
