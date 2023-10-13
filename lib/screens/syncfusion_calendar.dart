import 'package:conference_hall_booking/screens/addBooking.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:conference_hall_booking/models/events.dart'; // Import your BookingDetails and Data models
import 'package:conference_hall_booking/utils/booking_alert_dialog.dart'; // Import your BookingAlertDialog
import 'package:conference_hall_booking/api/booking_details_api.dart'; // Import your getBookingDetails function
import 'dart:math';

class SyncfusionCalendar extends StatefulWidget {
  const SyncfusionCalendar({Key? key}) : super(key: key);

  @override
  State<SyncfusionCalendar> createState() => _SyncfusionCalendarState();
}

class _SyncfusionCalendarState extends State<SyncfusionCalendar> {
  late Future<BookingDetails>
      bookingDetailsResponse; // Make bookingDetailsResponse a Future

  List<Appointment> _appointments =
      []; // Initialize an empty list of Appointments
  BookingAlertDialog alertDialog = BookingAlertDialog();

  @override
  void initState() {
    super.initState();
    bookingDetailsResponse = getBookingDetails(); // Initialize the Future here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load appointments when the Future is resolved
    bookingDetailsResponse.then((bookingDetails) {
      _loadAppointments(bookingDetails);
    });
  }

  void _loadAppointments(BookingDetails bookingDetails) {
    if (bookingDetails.data != null) {
      // Generate a random color for each appointment
      final Random random = Random();
      final List<Color> appointmentColors = List.generate(
        bookingDetails.data!.length,
        (index) => Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1.0,
        ),
      );

      // Convert Data objects to Appointment objects with random colors
      _appointments = bookingDetails.data!.asMap().entries.map((entry) {
        final data = entry.value;
        final color = appointmentColors[entry.key];
        print(
            '${data.bookingDate} ${data.bookingDate.runtimeType} date format incorrect error check');

        print(
            '${data.strTime} ${data.strTime.runtimeType} start time format incorrect error check');

        return Appointment(
          startTime: DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
          endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
          // startTime: DateTime.parse(data.strTime!),
          // endTime: DateTime.parse(data.endTime!),
          subject: data.meetingTitle!,
          color: color, // Use the random color
        );
      }).toList();

      // Ensure the state is updated after loading appointments
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 241, 231, 195),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return alertDialog;
          //   },
          // );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBooking()));
        },
      ),
      body: SfCalendar(
        specialRegions: _getTimeRegions(),
        view: CalendarView.week,
        dataSource: _getCalendarDataSource(),
        timeSlotViewSettings: TimeSlotViewSettings(startHour: 7, endHour: 20),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.targetElement == CalendarElement.appointment) {
            final tappedAppointment =
                calendarTapDetails.appointments!.first as Appointment;
            _showEventDetailsDialog(tappedAppointment);
          }
        },
      ),
    );
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];

    final List<DateTime> specifiedDates = [
      DateTime(2023, 1, 1),
      DateTime(2023, 1, 14),
      DateTime(2023, 1, 26),
      DateTime(2023, 3, 8),
      DateTime(2023, 3, 22),
      DateTime(2023, 5, 1),
      DateTime(2023, 8, 15),
      DateTime(2023, 8, 30),
      DateTime(2023, 10, 2),
      DateTime(2023, 10, 24),
      DateTime(2023, 11, 12),
      DateTime(2023, 11, 13),
    ];

    for (final date in specifiedDates) {
      regions.add(TimeRegion(
        startTime: DateTime(date.year, date.month, date.day, 0, 0, 0),
        endTime: DateTime(date.year, date.month, date.day, 19, 59, 59),

        //recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=SUN',
        color: Color.fromARGB(255, 241, 231, 195),
      ));
    }
    for (final date in specifiedDates) {
      regions.add(TimeRegion(
        startTime: DateTime(date.year, date.month, date.day, 0, 0, 0),
        endTime: DateTime(date.year, date.month, date.day, 19, 59, 59),
        recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=SUN',
        color: Color(0xffbD3D3D3),
      ));
    }

    return regions;
  }

  void _showEventDetailsDialog(Appointment appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Title: ${appointment.subject}'),
              Text('Start Time: ${appointment.startTime}'),
              Text('End Time: ${appointment.endTime}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  _DataSource _getCalendarDataSource() {
    return _DataSource(_appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
