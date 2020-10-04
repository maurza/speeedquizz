import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:speedquizz/extras/paths.dart';

class OnboardingController extends ControllerMVC {
  factory OnboardingController() {
    _this = OnboardingController._();
    return _this;
  }
  static OnboardingController _this;

  OnboardingController._();

  static OnboardingController get con => _this;
  int currentData = 0;
  List<IntroData> data = [
    IntroData(
        media: Image.asset(paths.paso1),
        text: 'Juguemos hasta aprender y ser los mejores!',
        progreso: .2),
    IntroData(
        media: Image.asset(paths.paso2),
        text: 'Ejercitemos la memoria con juegos nemotécnicos!',
        progreso: .4),
    IntroData(
        media: Image.asset(paths.paso3),
        text: 'La práctica nos ayuda a aprender!',
        progreso: .6),
    IntroData(
        media: Image.asset(paths.paso4),
        text: 'Miremos un tutorial!',
        progreso: .8),
    IntroData(
      media: Image.asset(paths.paso5),
      text: 'Empecemos!',
      progreso: 1,
    )
  ];
  nextTip() {
    setState(() {
      if (currentData < data.length - 1) {
        currentData = currentData + 1;
      } else {}
    });
  }
}

class IntroData {
  Widget media;
  String text;
  double progreso;

  IntroData({this.media, this.text, this.progreso});
}
