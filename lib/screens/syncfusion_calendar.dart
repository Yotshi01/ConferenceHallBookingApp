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

        return Appointment(
          startTime: DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
          endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
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
        backgroundColor: Colors.amber[600],
        child: Icon(
          Icons.add,
          color: Colors.white,
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
