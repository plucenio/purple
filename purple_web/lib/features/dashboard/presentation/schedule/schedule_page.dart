import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../../../lib.dart';

// ignore: constant_identifier_names
const int START_HOUR = 6;

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WeekView(
        showWeekends: false,
        startHour: START_HOUR,
        //eventTileBuilder:
        //    (date, events, boundary, startDuration, endDuration) => Container(
        //  color: events.first.color,
        //  child: Text(events.first.title),
        //),
        onDateTap: (date) {
          setState(() {
            final event = CalendarEventData(
              date: date,
              title: 'Event 1',
              startTime: date.add(const Duration(hours: START_HOUR)),
              endTime: date.add(const Duration(hours: START_HOUR + 1)),
            );
            CalendarControllerProvider.of(context).controller.add(event);
            context.showSnackBar(
              SuccessSnackBar(
                content: Text(
                  'Teste de evento no dia ${date.day}',
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
