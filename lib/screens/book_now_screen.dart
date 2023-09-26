// import 'dart:html';

import 'package:conference_hall_booking/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

class BookNow extends StatefulWidget {
  const BookNow({super.key});

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  Map<DateTime, List<Event>>? _events;
  late final ValueNotifier<List<Event>> _selectedEvents;
  TextEditingController _eventController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events![day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.21, -0.98),
              end: Alignment(-0.21, 0.98),
              colors: [Colors.white, Color(0x00DBCC95)],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Book Now',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: 0.16,
          ),
        ),
        // backgroundColor: const Color(0xFF048B3F),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Event Name"),
                  content: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // _events!.addAll({
                        //   _selectedDay: [Event(_eventController.text)]
                        // });

                        // _events!.update(_selectedDay, (events) {
                        //   if (events != null) {
                        //     events.add(Event(_eventController.text));
                        //     return events;
                        //   } else {
                        //     return [Event(_eventController.text)];
                        //   }
                        // });

                        if (!_events!.containsKey(_selectedDay)) {
                          _events![_selectedDay] = [
                            Event(_eventController.text)
                          ];
                        } else {
                          _events![_selectedDay]!
                              .add(Event(_eventController.text));
                        }

                        Navigator.of(context).pop();
                        _selectedEvents.value = _getEventsForDay(_selectedDay);
                      },
                      child: Text("Submit"),
                    ),
                  ],
                );
              });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.21, -0.98),
            end: Alignment(-0.21, 0.98),
            colors: [Colors.white, Color(0x00DBCC95)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2040, 10, 20),
              focusedDay: _focusedDay,
              headerVisible: true,
              daysOfWeekVisible: true,
              sixWeekMonthsEnforced: true,
              shouldFillViewport: false,
              eventLoader: _getEventsForDay,
              headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w800)),
              calendarStyle: CalendarStyle(
                  todayTextStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.
                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = selectedDay;
                    _selectedEvents.value = _getEventsForDay(selectedDay);
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              // onPageChanged: (focusedDay) {
              //   // No need to call `setState()` here
              //   _focusedDay = focusedDay;
              // },
            ),
            Expanded(
                child: ValueListenableBuilder<List<Event>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                onTap: () => print(""),
                                title: Text('${value[index]}'),
                              ),
                            );
                          });
                    })),
          ],
        ),
      ),
    );
  }
}
