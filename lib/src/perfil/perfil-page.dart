import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
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
                            buttonBorderColor:
                                Hexcolor('#94D9D4').withOpacity(0.7),
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
          ),
        ],
      ),
    );
  }
}
