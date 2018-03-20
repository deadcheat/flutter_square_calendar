import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:square_calendar/src/calendar_gridtile_builder.dart';

const int _FirstDate = 1;
const int _ADayBeforeFirstDay = 0;
const int _WeekDaysCount = 7;
const double _DefaultMainAxisSpacing = 4.0;
const double _DefaultCrossAxisSpacing = 4.0;
const EdgeInsets _DefaultPadding =  const EdgeInsets.all(10.0);

class SquareCalendar extends StatefulWidget {
  const SquareCalendar({
    Key key,
    @required this.year,
    @required this.month,
    this.day: _FirstDate,
    this.revealBaseDay: false,
    this.mainAxisSpacing: _DefaultMainAxisSpacing,
    this.crossAxissSpacing: _DefaultCrossAxisSpacing,
    this.padding: _DefaultPadding,
    this.tileBuilder: const DefaultCalendarGridTileBuilder(),
  }): super(key: key);

  final bool revealBaseDay;

  final CalendarGridTileBuilder tileBuilder;

  final int year;
  final int month;
  final int day;

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
    final weekDays = ['Sun', 'Mon','Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final headers = new List.generate(7, (i) =>i).map((int i) {
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
      return new GridTile(
              child: new Text(weekDays[i], style: textStyle, textAlign: TextAlign.center,),
            );
    }).toList();
    final baseDay = new DateTime(widget.year, widget.month, widget.day);
    final firstdayOfMonth = new DateTime(baseDay.year, baseDay.month,_FirstDate);
    final calendarDates = new List.generate(35, (i) => 
      new DateTime(firstdayOfMonth.year, firstdayOfMonth.month, firstdayOfMonth.day + (i-firstdayOfMonth.weekday))
    );
    final calendar = new List.generate(35, (i) =>i).map((int i) {
      final date = calendarDates[i];
      return widget.tileBuilder(date, baseDay);
    }).toList();
    headers.addAll(calendar);
    return headers;
  }
}