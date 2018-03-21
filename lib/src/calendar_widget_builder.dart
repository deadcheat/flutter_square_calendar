import 'package:flutter/material.dart';

typedef Widget CalendarWidgetBuilder(
  int index,
  DateTime date,
  DateTime baseDate,
  DateTime firstDayOfMonth,
  DateTime lastDayOfMonth,
);

class DefaultCalendarWidgetBuilder {
  const DefaultCalendarWidgetBuilder();
  Widget call(
    int index,
    DateTime date,
    DateTime baseDate,
    DateTime firstDayOfMonth,
    DateTime lastDayOfMonth,
  ) {
    var textStyle = new TextStyle(fontWeight: FontWeight.bold);
    if (baseDate != null && date.month != baseDate.month) {
      textStyle = textStyle.apply(color: Colors.grey);
    } else {
      switch (date.weekday) {
        case 7:
          textStyle = textStyle.apply(color: Colors.red);
          break;
        case 6:
          textStyle = textStyle.apply(color: Colors.blue);
          break;
        default:
      }
    }
    return new Text(
      date.day.toString(),
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
