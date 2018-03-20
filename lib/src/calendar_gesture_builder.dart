import 'package:flutter/material.dart';

typedef GestureDetector CalendarGridGestureDetectorBuilder(
  GridTile child, {
  int index,
  DateTime baseDate,
  DateTime firstDayOfMonth,
  DateTime lastDayOfMonth,
});

class DefaultCalendarGridGestureDetectorBuilder {
  const DefaultCalendarGridGestureDetectorBuilder();
  GestureDetector call(
    GridTile child, {
    int index,
    DateTime baseDate,
    DateTime firstDayOfMonth,
    DateTime lastDayOfMonth,
  }) {
    return new GestureDetector(
      child: child,
    );
  }
}
