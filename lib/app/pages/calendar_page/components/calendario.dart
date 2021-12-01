import 'package:app_ibdf/app/models/events.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key, required this.selectedEvents}) : super(key: key);
  final Map<DateTime, List<Events>> selectedEvents;

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  

  List<Events> _getEventsFromDay(DateTime date) {
    return widget.selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            availableCalendarFormats: const {
              CalendarFormat.month : "Mês",
              CalendarFormat.twoWeeks: "2 Semanas",
              CalendarFormat.week: "Uma Semana",
            },
            
            locale: 'pt_br',
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2030),
            eventLoader: _getEventsFromDay,
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          const SizedBox(height: 50),
     
     ..._getEventsFromDay(_focusedDay).map(
            (Events event) => Column(
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider()
              ],
            ),
          ).toList()
          
         
        ],
      ),
    );
  }
}
