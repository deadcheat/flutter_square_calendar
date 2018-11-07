import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:square_calendar/src/calendar_widget_builder.dart';

const int _FirstDate = 1;
const int _WeekDaysCount = 7;
const double _DefaultMainAxisSpacing = 4.0;
const double _DefaultCrossAxisSpacing = 4.0;
const EdgeInsets _DefaultPadding = const EdgeInsets.all(10.0);

class SquareCalendar extends StatefulWidget {
  const SquareCalendar({
    Key key,
    @required this.year,
    @required this.month,
    this.hasHeader = true,
    this.day: _FirstDate,
    this.mainAxisSpacing: _DefaultMainAxisSpacing,
    this.crossAxissSpacing: _DefaultCrossAxisSpacing,
    this.padding: _DefaultPadding,
    this.gestureBuilder: const DefaultCalendarGridGestureDetectorBuilder(),
    this.tileBuilder: const DefaultCalendarGridTileBuilder(),
    this.widgetBuilder: const DefaultCalendarWidgetBuilder(),
  }) : super(key: key);

  final CalendarNestedWidgetBuilder tileBuilder;
  final CalendarNestedWidgetBuilder gestureBuilder;
  final CalendarWidgetBuilder widgetBuilder;

  final int year;
  final int month;
  final int day;

  final bool hasHeader;

  final double mainAxisSpacing;
  final double crossAxissSpacing;

  final EdgeInsets padding;

  @override
  State<StatefulWidget> createState() => new _SquareCalendarState();
}

class _SquareCalendarState extends State<SquareCalendar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.count(
      crossAxisCount: _WeekDaysCount,
      padding: widget.padding,
      mainAxisSpacing: widget.mainAxisSpacing,
      crossAxisSpacing: widget.crossAxissSpacing,
      children: _buildDaysGridTiles(context),
    );
  }

  List<Widget> _buildDaysGridTiles(BuildContext context) {
    final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final calendar = [];
    if (widget.hasHeader) {
      calendar.addAll(new List.generate(7, (i) => i).map((int i) {
        var textStyle = new TextStyle(fontWeight: FontWeight.bold);
        switch (i) {
          case 0:
            textStyle = textStyle.apply(color: Colors.red);
            break;
          case 6:
            textStyle = textStyle.apply(color: Colors.blue);
            break;
          default:
        }
        return new GestureDetector(
          child: new GridTile(
            child: new Text(
              weekDays[i],
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList());
    }
    final baseDay = new DateTime(widget.year, widget.month, widget.day);
    final firstDayOfMonth =
        new DateTime(baseDay.year, baseDay.month, _FirstDate);
    final lastDayOfMonth = new DateTime(baseDay.year, baseDay.month + 1, 0);

    var coefficient = firstDayOfMonth.weekday;
    if (coefficient == 7) {
      coefficient = 0;
    }
    var rowNum = 35;
    if ((coefficient + lastDayOfMonth.day) > 35) {
      rowNum = 42;
    }
    final calendarDates = new List.generate(
        rowNum,
        (i) => new DateTime(firstDayOfMonth.year, firstDayOfMonth.month,
            firstDayOfMonth.day + (i - coefficient)));
    final days = new List.generate(rowNum, (i) => i).map((int i) {
      final date = calendarDates[i];
      // return widget.tileBuilder(date, baseDate: baseDay);
      return widget.gestureBuilder(
        widget.tileBuilder(
            widget.widgetBuilder(
                i, date, baseDay, firstDayOfMonth, lastDayOfMonth),
            i,
            date,
            baseDay,
            firstDayOfMonth,
            lastDayOfMonth),
        i,
        date,
        baseDay,
        firstDayOfMonth,
        lastDayOfMonth,
      );
    }).toList();
    calendar.addAll(days);
    return calendar;
  }
}
