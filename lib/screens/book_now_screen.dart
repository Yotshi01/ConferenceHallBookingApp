// import 'dart:html';

import 'package:conference_hall_booking/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
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

  String? locationChoosed;
  String? conferenceRoomChoosed;
  List listLocations = [
    "Raipur",
    "Deorjhal",
    "Kohadia",
  ];
  List listConferenceRooms = [
    "1",
    "2",
    "3",
  ];

  TextEditingController _meetingTitleTextController = TextEditingController();
  TextEditingController _meetingDescriptionTextController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events![day] ?? [];
  }

  // Future<void> _selectTime(BuildContext context) async {
  //   TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );

  //   if (selectedTime != null) {
  //     // Do something with the selected time (e.g., update a variable, show it in a Text widget).
  //     print("Selected time: ${selectedTime.format(context)}");
  //   }
  // }

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
        backgroundColor: Colors.amber[600],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  scrollable: true,
                  title: Text("Event Booking"),
                  content: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.6,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final selectedDate =
                                    await _selectedDateTime(context);
                                if (selectedDate == null) return;
                                print(selectedDate);
                              },
                              child: Text('Select Date'),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final selectedTime =
                                    await _selectedTime(context);
                                if (selectedTime == null) return;
                                print(selectedTime);
                              },
                              child: Text('Select Time'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          'Select Location for Conference',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: DropdownButton(
                            underline: Container(height: 0),
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Select Location',
                                style: TextStyle(
                                  color: Color(0xFF898383),
                                  fontSize: 10,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            items: listLocations.map((valueItem) {
                              return DropdownMenuItem(
                                // hint: Text("Select Location"),
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                locationChoosed = newValue.toString();
                              });
                            },
                            value: locationChoosed,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: DropdownButton(
                            underline: Container(height: 0),
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Select Conference Room',
                                style: TextStyle(
                                  color: Color(0xFF898383),
                                  fontSize: 10,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            items: listConferenceRooms.map((valueItem) {
                              return DropdownMenuItem(
                                // hint: Text("Select Location"),
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                conferenceRoomChoosed = newValue.toString();
                              });
                            },
                            value: conferenceRoomChoosed,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          'Meeting Title',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        TextField(
                          controller: _eventController,
                          decoration: InputDecoration(
                            // labelText:
                            //     'Type a valid reason for postponing the meeting',
                            // labelStyle: TextStyle(
                            //   color: Color(0xFFC1BEBE),
                            //   fontSize: 12,
                            //   fontFamily: 'Noto Sans',
                            //   fontWeight: FontWeight.w400,
                            // ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          'Meeting Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        TextField(
                          controller: _meetingDescriptionTextController,
                          decoration: InputDecoration(
                            // labelText:
                            //     'Type a valid reason for postponing the meeting',
                            // labelStyle: TextStyle(
                            //   color: Color(0xFFC1BEBE),
                            //   fontSize: 12,
                            //   fontFamily: 'Noto Sans',
                            //   fontWeight: FontWeight.w400,
                            // ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                          maxLines: 7,
                          minLines: 3,
                        )
                      ],
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
                  selectedDecoration: BoxDecoration(
                    color: Colors.amber[600],
                    shape: BoxShape.circle,
                  ),
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
                // sample comment
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          scrollable: true,
                          title: Text("Day Schedule"),
                          content: Container(
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.7,
                            child: SfCalendar(
                              view: CalendarView.day,
                              // firstDayOfWeek: 1,
                              initialDisplayDate: _selectedDay,
                              dataSource: MeetingDataSource(getAppointments()),
                              timeSlotViewSettings: TimeSlotViewSettings(
                                  startHour: 8, endHour: 19),
                            ),
                          ),
                          actions: [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Text("Submit"),
                            // ),
                          ],
                        );
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

  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  Future<DateTime?> _selectedDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Conference',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=10'));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
