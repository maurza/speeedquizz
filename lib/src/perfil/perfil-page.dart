import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/widgets/buttons/rounder-button.dart';
import 'package:speedquizz/widgets/inputs/email-input.dart';
import 'package:speedquizz/widgets/inputs/fecha-input.dart';
import 'package:speedquizz/widgets/inputs/text-input.dart';
import './perfil-controller.dart';

class PerfilPage extends StatefulWidget {
  static const route = 'perfil';
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends StateMVC<PerfilPage> {
  _PerfilPageState() : super(PerfilController()) {
    controller = PerfilController.con;
  }

  PerfilController controller;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardClose = (MediaQuery.of(context).viewInsets.bottom == 0.0);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: ListView(
          padding: dimens.symetric(context, .1, .05),
          children: [
            Container(
                margin: dimens.bottom(context, .05),
                alignment: Alignment.center,
                height: dimens.fullWidth(context) * .5,
                width: dimens.fullWidth(context) * .5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colores.purpuracards),
                child: Container(
                    height: dimens.fullWidth(context) * .4,
                    width: dimens.fullWidth(context) * .35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/images/card1.png"),
                            fit: BoxFit.fitWidth)))),
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Todos los datos marcados con * son obligatorios"),
                  TextInput(
                    textController: controller.nickNameController,
                    labelText: 'Apodo *',
                  ),
                  TextInput(
                    textController: controller.nombreController,
                    labelText: 'Nombre *',
                  ),
                  EmailInput(
                      emailController: controller.emailControllers,
                      labelText: 'Correo *'),
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
                  Visibility(
                      visible: false,
                      child: Text(
                        'Revisa los datos!',
                        style: TextStyle(
                            fontSize: dimens.fullWidth(context) * .045,
                            color: Colors.red),
                      )),
                  RounderButton(
                      buttonBorderColor: Hexcolor('#94D9D4').withOpacity(0.7),
                      buttonColor: Hexcolor('#E4907A'),
                      buttonText: 'Actualizar',
                      onClick: () {
                        controller.validateform(context);
                        print('My button');
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
