import 'package:flutter/material.dart';
import 'package:speedquizz/extras/dimens.dart';

class SimpleCard extends StatelessWidget {
  final Color color;
  final String imagepath;
  final String texto;
  final Function onClick;
  const SimpleCard(
      {Key key,
      @required this.color,
      @required this.imagepath,
      @required this.texto,
      @required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: dimens.bottom(context, .02),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color.withOpacity(.8),
                  borderRadius: dimens.borderRadiusContainer(15)),
            ),
            Container(
              margin: dimens.top(context, .05),
              padding: dimens.symetric(context, .05, .02),
              decoration: BoxDecoration(
                  color: color, borderRadius: dimens.borderRadiusContainer(15)),
              child: Row(
                children: [
                  Container(
                    margin: dimens.right(context, .05),
                    child: Image.asset(
                      imagepath,
                      width: dimens.fullWidth(context) * .13,
                      height: dimens.fullHeigth(context) * .13,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    texto,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: dimens.fullWidth(context) * 0.06),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}