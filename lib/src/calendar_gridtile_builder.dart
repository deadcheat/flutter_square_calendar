import 'package:flutter/material.dart';

typedef Widget CalendarGridTileBuilder(
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
  Widget call(
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
