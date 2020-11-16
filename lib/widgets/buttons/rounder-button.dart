import 'package:flutter/material.dart';
import 'package:speedquizz/extras/dimens.dart';

class RounderButton extends StatelessWidget {
  final Color buttonColor;
  final Color buttonBorderColor;
  final String buttonText;
  final Function onClick;
  final double radius;

  const RounderButton(
      {Key key,
      this.buttonColor,
      this.buttonBorderColor,
      this.buttonText,
      this.onClick,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: dimens.vertical(context, .05),
      child: InkWell(
        borderRadius: dimens.borderRadiusContainer(radius ?? 30.0),
        onTap: onClick,
        child: Container(
          padding: dimens.all(context, .02),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(radius ?? 30.0),
              border: Border.all(color: buttonBorderColor)),
          child: InkWell(
            onTap: onClick,
            child: Text(
              buttonText.toUpperCase(),
              style: TextStyle(
                  fontSize: dimens.fullWidth(context) * .08,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
