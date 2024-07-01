import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  const CustomCalendar({
    Key? key,
    this.selectedDay
  }) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool _isSameMonth(DateTime date, DateTime focusedDay) {
    return date.year == focusedDay.year && date.month == focusedDay.month;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat.yMMMM('ja_JP')
                    .format(_focusedDay), // Display month and year in Japanese
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(_focusedDay.year,
                        _focusedDay.month - 1, _focusedDay.day);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(_focusedDay.year,
                        _focusedDay.month + 1, _focusedDay.day);
                  });
                },
              ),
            ],
          ),
          TableCalendar(
            locale: 'ja_JP', // Set locale to Japanese
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            daysOfWeekHeight: Dimens.gap_dp50,
            rowHeight: Dimens.gap_dp60,
            availableGestures: AvailableGestures.none,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.black),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 1.0), // Border for default days
                shape: BoxShape.rectangle,
              ),
              dowTextFormatter: (date, locale) {
                return DateFormat.E(locale).format(date).substring(0, 1);
              },
            ),

            enabledDayPredicate: (date) {
              return _isSameMonth(date, _focusedDay);
            },
            headerVisible: false, // Hide default header
            calendarStyle: CalendarStyle(
              outsideDaysVisible: true,
              cellMargin: EdgeInsets.all(0.0),
              cellPadding: EdgeInsets.all(0.0),
              outsideTextStyle: TextStyle(color: Colors.transparent),
              disabledTextStyle: TextStyle(color: Colors.transparent),
              disabledDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for default days
                shape: BoxShape.rectangle,
              ),
              weekendTextStyle: TextStyle(color: AppTheme.black),
              defaultDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for default days
                shape: BoxShape.rectangle,
              ),
              weekendDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for weekends
                shape: BoxShape.rectangle,
              ),
              rowDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for weekends
                shape: BoxShape.rectangle,
              ),
              outsideDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for weekends
                shape: BoxShape.rectangle,
              ),
              cellAlignment: Alignment.topCenter,
              selectedTextStyle: TextStyle(color: AppTheme.black),
              selectedDecoration: CustomDecoration(),
              todayTextStyle: TextStyle(color: AppTheme.black),
              todayDecoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 0.5), // Border for weekends
                shape: BoxShape.rectangle, // Border for selected day
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CustomDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomDecorationPainter();
  }
}

class _CustomDecorationPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final rect = offset & configuration.size!;
    canvas.drawRect(rect, paint);

    final linePaint = Paint()
      ..color = AppTheme.error
      ..strokeWidth = Dimens.gap_dp4;

    // Draw a line inside the rectangle
    final start = Offset(rect.left + Dimens.gap_dp10, rect.bottom - Dimens.gap_dp10);
    final end = Offset(rect.right - Dimens.gap_dp10, rect.bottom - Dimens.gap_dp10);
    canvas.drawLine(start, end, linePaint);
  }
}