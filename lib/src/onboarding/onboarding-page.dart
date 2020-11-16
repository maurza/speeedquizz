import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:speedquizz/extras/colores.dart';
import 'package:speedquizz/extras/dimens.dart';
import 'package:speedquizz/extras/paths.dart';
import 'package:speedquizz/src/onboarding/onboarding-controller.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends StateMVC<OnboardingPage> {
  _OnboardingPageState() : super(OnboardingController()) {
    controller = OnboardingController.con;
  }

  OnboardingController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              paths.logo,
              width: dimens.fullWidth(context) * .28,
            )
          ],
        ),
      ),
      body: InkWell(
        onTap: () {
          controller.nextTip(context);
        },
        child: Container(
          padding: dimens.all(context, .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              controller.data[controller.currentData].media,
              Text(
                controller.data[controller.currentData].text,
                style: TextStyle(
                    fontSize: dimens.fullWidth(context) * .08,
                    fontWeight: FontWeight.w700,
                    color: colores.gris),
              ),
              LinearPercentIndicator(
                width: dimens.fullWidth(context) * .8,
                lineHeight: 14.0,
                percent: controller.data[controller.currentData].progreso,
                backgroundColor: colores.grisclaro,
                progressColor: colores.azuloscuro,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
