import 'package:flutter/material.dart';

import 'dimens.dart';

/// esta clase  contiene todos  los
/// textStyles   que se usarann en  el app
class Styles {
  TextStyle large(BuildContext context) {
    return TextStyle(fontSize: dimens.fullWidth(context) * .05);
  }

  TextStyle extraLargeBold(BuildContext context) {
    return TextStyle(
        fontSize: dimens.fullWidth(context) * .07, fontWeight: FontWeight.w700);
  }

  TextStyle largeBold(BuildContext context) {
    return TextStyle(
        fontSize: dimens.fullWidth(context) * .05, fontWeight: FontWeight.w700);
  }

  TextStyle regular(BuildContext context) {
    return TextStyle(fontSize: dimens.fullWidth(context) * .04);
  }

  TextStyle mini(BuildContext context) {
    return TextStyle(fontSize: dimens.fullWidth(context) * .03);
  }

  TextStyle miniBold(BuildContext context) {
    return TextStyle(
        fontSize: dimens.fullWidth(context) * .03, fontWeight: FontWeight.w700);
  }
}

Styles styles = Styles();
