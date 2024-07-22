import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final Function(DateTime selectedDate, dynamic event)? onChagned;
  final Map<String, List<dynamic>> events;

  const CustomCalendar(
      {super.key, this.selectedDay, this.onChagned, this.events = const {}});

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  double borderWidth = Dimens.gap_dp1;
  Map<String, List<dynamic>> _events = {};

  bool _isSameMonth(DateTime date, DateTime focusedDay) {
    return date.year == focusedDay.year && date.month == focusedDay.month;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;
    _events = widget.events;
  }

  @override
  void didUpdateWidget(covariant CustomCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.events != _events) {
      setState(() {
        _events = widget.events;
      });
    }
  }

  Widget _getCalendarHeader() {
    return Row(
      children: [
        Text(
          DateFormat.yMMMM('ja_JP')
              .format(_focusedDay), // Display month and year in Japanese
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.mainDark),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.chevron_left),
          color: AppTheme.mainDark,
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(
                  _focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          color: AppTheme.mainDark,
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(
                  _focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
            });
          },
        ),
      ],
    );
  }

  CalendarStyle getCalendarStyle() {
    return CalendarStyle(
      outsideDaysVisible: true,
      tableBorder: const TableBorder(
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          horizontalInside: BorderSide(color: Colors.black),
          verticalInside: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black)),
      cellMargin: const EdgeInsets.all(0.0),
      cellPadding: const EdgeInsets.all(0.0),
      outsideTextStyle: const TextStyle(color: Colors.transparent),
      disabledTextStyle: const TextStyle(color: Colors.transparent),
      disabledDecoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for default days
        shape: BoxShape.rectangle,
      ),
      weekendTextStyle: const TextStyle(color: AppTheme.black),
      defaultDecoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for default days
        shape: BoxShape.rectangle,
      ),
      weekendDecoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for weekends
        shape: BoxShape.rectangle,
      ),
      rowDecoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for weekends
        shape: BoxShape.rectangle,
      ),
      outsideDecoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for weekends
        shape: BoxShape.rectangle,
      ),
      todayDecoration: BoxDecoration(
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for weekends
        shape: BoxShape.rectangle, // Border for selected day
      ),
      markerSize: Dimens.gap_dp60,
      markerDecoration: CustomDecoration(),
      selectedDecoration: BoxDecoration(
        color: const Color(0x88FF00FF),
        border: Border.all(
            color: Colors.black, width: borderWidth), // Border for weekends
        shape: BoxShape.rectangle, // Border for selected day
      ),
      cellAlignment: Alignment.topCenter,
      defaultTextStyle: const TextStyle(color: AppTheme.mainDark),
      selectedTextStyle: const TextStyle(color: AppTheme.black),
      todayTextStyle: const TextStyle(color: AppTheme.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.gap_dp8),
      child: Column(
        children: [
          _getCalendarHeader(),
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
                if (widget.onChagned != null) {
                  widget.onChagned!(selectedDay,
                      _events[DateFormat('yyyy-MM-dd').format(selectedDay)]);
                }
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
              weekdayStyle:
                  const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.black),
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
            calendarStyle: getCalendarStyle(),
            eventLoader: (date) {
              return _events[DateFormat('yyyy-MM-dd').format(date)] ?? [];
            },
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
    final start =
        Offset(rect.left + Dimens.gap_dp10, rect.bottom - Dimens.gap_dp26);
    final end =
        Offset(rect.right - Dimens.gap_dp10, rect.bottom - Dimens.gap_dp26);
    canvas.drawLine(start, end, linePaint);
  }
}
