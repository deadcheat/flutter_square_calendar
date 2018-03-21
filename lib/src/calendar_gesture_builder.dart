import 'package:flutter/material.dart';

typedef GestureDetector CalendarGridGestureDetectorBuilder(
  GridTile child,
  int index,
  DateTime date,
  DateTime baseDate,
  DateTime firstDateOfMonth,
  DateTime lastDateOfMonth,
);

class DefaultCalendarGridGestureDetectorBuilder {
  const DefaultCalendarGridGestureDetectorBuilder();
  GestureDetector call(
    GridTile child,
    int index,
    DateTime date,
    DateTime baseDate,
    DateTime firstDateOfMonth,
    DateTime lastDateOfMonth,
  ) {
    return new GestureDetector(
      child: child,
    );
  }
}
