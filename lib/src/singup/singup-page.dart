import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/src/singup/singup-controller.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';
import 'package:speedquizz/widgets/inputs/email-input.dart';
import 'package:speedquizz/widgets/inputs/password-input.dart';
import 'package:speedquizz/widgets/inputs/text-input.dart';
import '../../extras/dimens.dart';
import '../../widgets/inputs/fecha-input.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends StateMVC<SingupPage> {
  _SingupPageState() : super(SingupController()) {
    controller = SingupController.con;
  }

  SingupController controller;

  @override
  Widget build(BuildContext context) {
    bool isKeyboardClose = (MediaQuery.of(context).viewInsets.bottom == 0.0);

    return Scaffold(
      backgroundColor: Colors.white,
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
                          paths.logo,
                          width: dimens.fullWidth(context) * 0.32,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextInput(
                          textController: controller.nickNameController,
                          labelText: 'Apodo',
                        ),
                        TextInput(
                          textController: controller.nombreController,
                          labelText: 'Nombre',
                        ),
                        EmailInput(emailController: controller.emailController),
                        FechaInput(
                          onConfirm: controller.onDateAccept,
                          value: controller.fechaInputValue(),
                        ),
                        TextInput(
                          textController: controller.carreraController,
                          labelText: 'Carrera',
                        ),
                        TextInput(
                          textController: controller.institucionController,
                          labelText: 'Institución',
                        ),
                        PasswordInput(
                            passwordController: controller.passwordController),
                        Row(
                          children: [
                            Checkbox(
                                value: controller.tycAcepted,
                                onChanged: (value) => controller.onTyCUpdate()),
                            Expanded(
                              child: Text(
                                  'Para registrarse por favor aceptar terminos y condiciones'),
                            )
                          ],
                        ),
                        Visibility(
                            visible: controller.failedRegistro,
                            child: Text(
                              'Registro FALLIDO!',
                              style: TextStyle(
                                  fontSize: dimens.fullWidth(context) * .045,
                                  color: Colors.red),
                            )),
                        RounderButton(
                            buttonBorderColor:
                                Hexcolor('#94D9D4').withOpacity(0.7),
                            buttonColor: Hexcolor('#E4907A'),
                            buttonText: 'Registrarse',
                            onClick: () {
                              controller.validateForm(context);
                              print('My button');
                            })
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
