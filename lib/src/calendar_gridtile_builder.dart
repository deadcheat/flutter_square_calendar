import 'package:flutter/material.dart';

typedef GridTile CalendarGridTileBuilder(DateTime date, DateTime baseDate);

final defaultTileBuilder = new DefaultCalendarGridTileBuilder();

/**
 * DefaultCalendarGridTileBuilder
 * default implementation for CalendarGridTileBuilder
 */
class DefaultCalendarGridTileBuilder {
  const DefaultCalendarGridTileBuilder();
  GridTile call(DateTime date, DateTime baseDate) {
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
      return new GridTile(
      child: new Text(date.day.toString(), style: textStyle, textAlign: TextAlign.center,));
  }
}