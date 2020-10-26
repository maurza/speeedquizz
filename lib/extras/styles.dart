import 'package:flutter/material.dart';

import 'dimens.dart';

/// esta clase  contiene todos  los
/// textStyles   que se usarann en  el app
class Styles {
  TextStyle large(BuildContext context) {
    return TextStyle(fontSize: dimens.fullWidth(context) * .05);
  }

  TextStyle regular(BuildContext context) {
    return TextStyle(fontSize: dimens.fullWidth(context) * .04);
  }
}

Styles styles = Styles();
