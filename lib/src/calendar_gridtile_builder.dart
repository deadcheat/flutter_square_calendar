import 'package:flutter/material.dart';

typedef GridTile CalendarGridTileBuilder(
  Widget child,
  int index,
  DateTime date,
  DateTime baseDate,
  DateTime firstDayOfMonth,
  DateTime lastDayOfMonth,
);

/// DefaultCalendarGridTileBuilder
/// default implementation for CalendarGridTileBuilder
class DefaultCalendarGridTileBuilder {
  const DefaultCalendarGridTileBuilder();
  GridTile call(
    Widget child,
    int index,
    DateTime date,
    DateTime baseDate,
    DateTime firstDayOfMonth,
    DateTime lastDayOfMonth,
  ) {
    return new GridTile(
      child: child,
    );
  }
}
