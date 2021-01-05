import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'taskStructure.dart';
// import 'package:intl/date_symbol_data_local.dart'; USE THIS LATER

class ThirdScreen extends StatefulWidget {
  final TaskStructure eventTask;
  ThirdScreen({Key key, this.eventTask}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  Map<DateTime, List> _events;
  List _eventsList;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    final _dateEvents = DateTime.now();

    _events = {
      _dateEvents.add(Duration(days: 4)): ['Event Placeholder'],
    };

    _eventsList = _events[_dateEvents] ?? [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _eventsList = events;
    });
  }

  Widget _buildEventsListView() {
    return ListView(
      children: _eventsList
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarView() {
    return TableCalendar(
        calendarController: _calendarController,
        events: _events,
        startingDayOfWeek: StartingDayOfWeek.monday,
        formatAnimation: FormatAnimation.slide,
        calendarStyle: CalendarStyle(
          selectedColor: Colors.purple[100],
          todayColor: Colors.purple[200],
          markersColor: Colors.purple[700],
          outsideDaysVisible: false,
          weekendStyle: TextStyle().copyWith(color: Colors.purple[400]),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle().copyWith(color: Colors.purple[400]),
        ),
        headerStyle: HeaderStyle(
          formatButtonTextStyle:
              TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
          formatButtonDecoration: BoxDecoration(
            color: Colors.purple[400],
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onDaySelected: _onDaySelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildCalendarView(),
        const SizedBox(
          height: 8.0,
        ),
        Expanded(child: _buildEventsListView())
      ],
    );
  }
}
