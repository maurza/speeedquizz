import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../extras/colores.dart';
import '../../extras/dimens.dart';

class FechaInput extends StatelessWidget {
  final Function onConfirm;
  final String value;

  const FechaInput({Key key, this.onConfirm, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: dimens.top(context, .05),
      decoration: BoxDecoration(
          color: colores.grisclaro.withOpacity(.5),
          borderRadius: dimens.borderRadiusContainer(10)),
      padding: dimens.left(context, .02),
      height: dimens.fullWidth(context) * .12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value ?? 'Fecha'),
          InkWell(
            onTap: () {
              showCalendar(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: colores.grisclaro,
                  borderRadius: dimens.borderRadiusContainer(10)),
              width: dimens.fullWidth(context) * .12,
              height: dimens.fullWidth(context) * .12,
              /* child: Icon(Icons.arrow_circle_down_rounded), */
            ),
          )
        ],
      ),
    );
  }

  /// Mostrar calendario
  showCalendar(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1950, 1, 1),
      maxTime: DateTime.now(),
      theme: DatePickerTheme(
          itemStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          doneStyle: TextStyle(
            color: colores.azul,
            fontSize: 16,
          )),
      onConfirm: (date) {
        onConfirm(date);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.es,
    );
  }
}
