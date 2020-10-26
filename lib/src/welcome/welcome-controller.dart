import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class WelcomeController extends ControllerMVC {
  factory WelcomeController() {
    _this = WelcomeController._();
    return _this;
  }
  static WelcomeController _this;

  WelcomeController._();

  static WelcomeController get con => _this;

  BuildContext context;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context = con.stateMVC.context;
    });
    super.initState();
  }

  goToOnboarding() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/onboarding',
      (Route<dynamic> route) => false,
    );
  }
}
