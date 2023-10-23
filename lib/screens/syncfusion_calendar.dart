import 'package:conference_hall_booking/api/holiday_api.dart';
import 'package:conference_hall_booking/screens/addBooking.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:conference_hall_booking/models/events.dart'; // Import your BookingDetails and Data models
import 'package:conference_hall_booking/utils/booking_alert_dialog.dart'; // Import your BookingAlertDialog
import 'package:conference_hall_booking/api/booking_details_api.dart'; // Import your getBookingDetails function
import 'dart:math';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:intl/intl.dart';

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
  List<DateTime> specifiedDates = [];
  BookingAlertDialog alertDialog = BookingAlertDialog();

  DateTime? selectedStartTime;
  DateTime? selectedEndTime;

  List<TimeRegion> bookedTimeSlots = [];
  bool isConflicting = false;
  bool isCheckboxTicked = false;

  @override
  void initState() {
    super.initState();
    bookingDetailsResponse = getBookingDetails(); // Initialize the Future here
    holidayDetailsResponse = getHolidayDetails();
    _fetchHolidayDetails();
    listOfFilteredMeetingsAccordingToDropdownSelections = listOfBookings;
  }

  String? selectedLocation;
  callBackLocationName(varSelectedLocation) {
    setState(() {
      selectedLocation = varSelectedLocation;
      // conferenceHallsAtSelectedLocation =
      //     getConferenceHallDataAccordingToSelectedLocation(varSelectedLocation);
      conferenceRoomChoosed = null;
    });
  }

  String? selectedConferenceHall;
  callBackConferenceHallName(varSelectedConferenceHall) {
    setState(() {
      selectedConferenceHall = varSelectedConferenceHall;
    });
  }

  Future<void> _fetchHolidayDetails() async {
    try {
      // bookingDetailsResponse = getBookingDetails();
      final HolidayDetails data = await holidayDetailsResponse;
      setState(() {
        if (data.data != null) {
          listOfHolidays = data.data!.map((item) {
            return HolidayData.fromJson(item.toJson());
          }).toList();
          print(listOfHolidays);
        }
      });
    } catch (error) {
      print('Error fetching holiday list data: $error');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load appointments when the Future is resolved
    _loadAppointments();
  }

  // void _loadAppointments(BookingDetails bookingDetails) {
  //   if (bookingDetails.data != null) {
  //     // Convert Data objects to Appointment objects with random colors

  //     print('${selectedLocation} kskskskskskskskskskakalalal');

  //     if (selectedLocation != null) {
  //       // Generate a random color for each appointment
  //       final Random random = Random();
  //       final List<Color> appointmentColors = List.generate(
  //         getBookingDataAccordingToSelectedLocation(selectedLocation!).length,
  //         (index) => Color.fromRGBO(
  //           random.nextInt(256),
  //           random.nextInt(256),
  //           random.nextInt(256),
  //           1.0,
  //         ),
  //       );
  //       setState(() {
  //         _appointments =
  //             getBookingDataAccordingToSelectedLocation(selectedLocation!)
  //                 .asMap()
  //                 .entries
  //                 .map((entry) {
  //           final data = entry.value;
  //           final color = appointmentColors[entry.key];

  //           // Create a TimeRegion to represent the booked time slot
  //           final timeRegion = TimeRegion(
  //             startTime:
  //                 DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
  //             endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
  //             color: color, // Use the same color as the appointment
  //           );

  //           bookedTimeSlots.add(timeRegion); // Add the TimeRegion to the list

  //           print(
  //               '${data.bookingDate} ${data.bookingDate.runtimeType} date format incorrect error check');

  //           print(
  //               '${data.strTime} ${data.strTime.runtimeType} start time format incorrect error check');

  //           print(
  //               '${data.bookingId} ${data.endTime} ${data.endTime.runtimeType} end time format incorrect error check');

  //           return Appointment(
  //             startTime:
  //                 DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
  //             endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
  //             // startTime: DateTime.parse(data.strTime!),
  //             // endTime: DateTime.parse(data.endTime!),
  //             subject: data.meetingTitle!,
  //             color: color, // Use the random color
  //           );
  //         }).toList();
  //       });
  //     } else {
  //       // Generate a random color for each appointment
  //       final Random random = Random();
  //       final List<Color> appointmentColors = List.generate(
  //         bookingDetails.data!.length,
  //         (index) => Color.fromRGBO(
  //           random.nextInt(256),
  //           random.nextInt(256),
  //           random.nextInt(256),
  //           1.0,
  //         ),
  //       );
  //       setState(() {
  //         _appointments = bookingDetails.data!.asMap().entries.map((entry) {
  //           final data = entry.value;
  //           final color = appointmentColors[entry.key];

  //           // Create a TimeRegion to represent the booked time slot
  //           final timeRegion = TimeRegion(
  //             startTime:
  //                 DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
  //             endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
  //             color: color, // Use the same color as the appointment
  //           );

  //           bookedTimeSlots.add(timeRegion); // Add the TimeRegion to the list

  //           print(
  //               '${data.bookingDate} ${data.bookingDate.runtimeType} date format incorrect error check');

  //           print(
  //               '${data.strTime} ${data.strTime.runtimeType} start time format incorrect error check');

  //           print(
  //               '${data.bookingId} ${data.endTime} ${data.endTime.runtimeType} end time format incorrect error check');

  //           return Appointment(
  //             startTime:
  //                 DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
  //             endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
  //             // startTime: DateTime.parse(data.strTime!),
  //             // endTime: DateTime.parse(data.endTime!),
  //             subject: data.meetingTitle!,
  //             color: color, // Use the random color
  //           );
  //         }).toList();
  //       });
  //     }

  //     // Ensure the state is updated after loading appointments
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   }
  // }

  void _loadAppointments() {
    bookedTimeSlots = [];
    print('vjhghhhhj');
    // List<BookingData> bookingDataList = [];
    // bookingDataList = listOfFilteredMeetingsAccordingToDropdownSelections;

    if (listOfFilteredMeetingsAccordingToDropdownSelections.isNotEmpty) {
      // Generate a random color for each appointment
      final Random random = Random();
      final List<Color> appointmentColors = List.generate(
        listOfFilteredMeetingsAccordingToDropdownSelections.length,
        (index) => Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1.0,
        ),
      );

      setState(() {
        _appointments = listOfFilteredMeetingsAccordingToDropdownSelections
            .asMap()
            .entries
            .map((entry) {
          final data = entry.value;
          final color = appointmentColors[entry.key];

          // Create a TimeRegion to represent the booked time slot
          final timeRegion = TimeRegion(
            startTime: DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
            endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
            color: color, // Use the same color as the appointment
          );

          bookedTimeSlots.add(timeRegion); // Add the TimeRegion to the list

          return Appointment(
            startTime: DateTime.parse(data.bookingDate! + ' ' + data.strTime!),
            endTime: DateTime.parse(data.bookingDate! + ' ' + data.endTime!),
            subject: data.meetingTitle!,
            color: color, // Use the random color
          );
        }).toList();
      });

      // Ensure the state is updated after loading appointments
      if (mounted) {
        setState(() {});
      }
    }
  }

  List<TimeRegion> _getDisabledTimeRegions() {
    List<TimeRegion> regions = <TimeRegion>[];

    // print(listOfHolidays);

    for (final nonWorkingDayDetails in listOfHolidays) {
      DateTime? nonWorkingDay =
          DateTime.tryParse(nonWorkingDayDetails.holidayDate!);
      specifiedDates.add(nonWorkingDay!);
      print('${nonWorkingDay} ${nonWorkingDayDetails.holidayDate!}');
    }

    // final List<DateTime> specifiedDates = [
    //   DateTime(2023, 1, 1),
    //   DateTime(2023, 1, 14),
    //   DateTime(2023, 1, 26),
    //   DateTime(2023, 3, 8),
    //   DateTime(2023, 3, 22),
    //   DateTime(2023, 5, 1),
    //   DateTime(2023, 8, 15),
    //   DateTime(2023, 8, 30),
    //   DateTime(2023, 10, 2),
    //   DateTime(2023, 10, 24),
    //   DateTime(2023, 11, 12),
    //   DateTime(2023, 11, 13),
    // ];

    // for (final date in specifiedDates) {
    //   regions.add(TimeRegion(
    //     startTime: DateTime(date.year, date.month, date.day, 0, 0, 0),
    //     endTime: DateTime(date.year, date.month, date.day, 19, 59, 59),

    //     //recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=SUN',
    //     color: Color.fromARGB(255, 241, 231, 195),
    //   ));
    // }
    for (final date in specifiedDates) {
      regions.add(TimeRegion(
        startTime: DateTime(date.year, date.month, date.day, 0, 0, 0),
        endTime: DateTime(date.year, date.month, date.day, 23, 59, 59),
        enablePointerInteraction:
            false, // Disables interaction with these dates
        textStyle: TextStyle(
          color: Colors.red, // Customize the text color for disabled dates
          decoration: TextDecoration
              .lineThrough, // Add a line through the text for a strikeout effect
        ),
        color: Color.fromARGB(255, 232, 220, 151)
            .withOpacity(0.2), // Set a background color for disabled dates
      ));
    }

    for (int month = 1; month <= 12; month++) {
      for (int day = 1; day <= 31; day++) {
        try {
          // Create a DateTime object for the current date
          DateTime currentDate = DateTime(DateTime.now().year, month, day);

          // Check if the current date is a Sunday (day of the week = 7)
          if (currentDate.weekday == 7) {
            // Create a time region for the entire Sunday
            DateTime startTime = DateTime(
                currentDate.year, currentDate.month, currentDate.day, 0, 0, 0);
            DateTime endTime = DateTime(currentDate.year, currentDate.month,
                currentDate.day, 23, 59, 59);

            regions.add(TimeRegion(
              startTime: startTime,
              endTime: endTime,
              enablePointerInteraction:
                  false, // Disables interaction with these dates
              textStyle: TextStyle(
                color:
                    Colors.red, // Customize the text color for disabled dates
                decoration: TextDecoration
                    .lineThrough, // Add a line through the text for a strikeout effect
              ),
              color: Colors.grey.withOpacity(
                  0.2), // Set a background color for disabled dates
            ));
          }
        } catch (e) {
          // Handle any potential date errors
        }
      }
    }

    // Add a region for the selected time slot
    if (selectedStartTime != null && selectedEndTime != null) {
      regions.add(TimeRegion(
        startTime: selectedStartTime!,
        endTime: selectedEndTime!,
        color: Colors.blue.withOpacity(0.5), // Customize the color
      ));
    }

    // Add the booked time slots
    regions.addAll(bookedTimeSlots);

    print(regions);
    return regions;
  }

  void handleCalendarTap(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      if (selectedStartTime == null) {
        setState(() {
          selectedStartTime = calendarTapDetails.date;
        });
      } else if (selectedEndTime == null) {
        setState(() {
          selectedEndTime = calendarTapDetails.date!.add(Duration(minutes: 15));
          isConflicting = _isTimeRangeConflicting();
        });

        // print('${selectedStartTime} starrrrrrrrrrrrrrrrrrrrrrrt');
        // print(selectedEndTime);
        // Handle the selected time range (start time and end time) here.
      } else {
        setState(() {
          // selectedStartTime = null;
          selectedStartTime = calendarTapDetails.date;
          selectedEndTime = null;
        });
      }
    }
  }

  bool _isTimeRangeConflicting() {
    // Iterate through booked appointments and check for conflicts
    for (final appointment in _appointments) {
      if (selectedEndTime != null) {
        // Check if the selected time range overlaps with the booked appointment
        if (selectedStartTime!.isBefore(appointment.startTime) &&
            selectedEndTime!.isAfter(appointment.endTime)) {
          return true; // Conflicting time range
        }
      }
    }
    return false; // No conflicts found
  }

  @override
  Widget build(BuildContext context) {
    _loadAppointments();
    print(
        '${selectedLocation} this is the start of the process of filtering using location');
    print(
        '${selectedConferenceHall} this is the start of the process of filtering using conference hall');
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
          onPressed: () async {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return alertDialog;
            //   },
            // );
            // passedSelectedStartTime = selectedStartTime;
            // passedSelectedEndTime = selectedEndTime;

            if (selectedStartTime != null && selectedEndTime != null) {
              final Duration duration =
                  (selectedEndTime!.difference(selectedStartTime!)).abs();
              if (duration < Duration(minutes: 45)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'The selected duration should be more than 45 minutes'),
                  ),
                );
              } else if (selectedStartTime!.isAfter(selectedEndTime!)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Start Time should be before End Time'),
                  ),
                );
              } else if ((selectedStartTime!.year == selectedEndTime!.year &&
                      selectedStartTime!.month == selectedEndTime!.month &&
                      selectedStartTime!.day == selectedEndTime!.day) ==
                  false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Start Time and end time should be on the same day'),
                  ),
                );
              } else if (isConflicting == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Slot not available. Please book in unbooked time range'),
                  ),
                );
              } else {
                // final DateFormat dateFormat = DateFormat.jm();
                // final String startTimeFormatted =
                //     dateFormat.format(selectedStartTime!);
                // final String endTimeFormatted = dateFormat.format(selectedEndTime!);

                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AddBooking(
                //         selectedStartTime: selectedStartTime ??
                //             DateTime
                //                 .now(), // Provide a default value or handle null appropriately

                //         selectedEndTime: selectedEndTime ?? DateTime.now());

                //     // AlertDialog(
                //     //   title: Text('Selected Time Range'),
                //     //   content: Column(
                //     //     crossAxisAlignment: CrossAxisAlignment.start,
                //     //     mainAxisSize: MainAxisSize.min,
                //     //     children: [
                //     //       Text('Start Time: $startTimeFormatted'),
                //     //       Text('End Time: $endTimeFormatted'),
                //     //     ],
                //     //   ),
                //     //   actions: [
                //     //     TextButton(
                //     //       onPressed: () {
                //     //         Navigator.of(context).pop();
                //     //       },
                //     //       child: Text('Close'),
                //     //     ),
                //     //   ],
                //     // );
                //   },
                // );

                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddBooking(
                              selectedStartTime: selectedStartTime ??
                                  DateTime
                                      .now(), // Provide a default value or handle null appropriately

                              selectedEndTime:
                                  selectedEndTime ?? DateTime.now(),

                              selectedLocation: selectedLocation!,
                              selectedConferenceHall: selectedConferenceHall!,
                            )));

                // Clear the selected times for the next selection
                selectedStartTime = null;
                selectedEndTime = null;
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Please select your time slot to add a booking'),
                ),
              );
            }
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              LocationsDropdown(callBackFunction: callBackLocationName),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              if (isCheckboxTicked == true)
                ConferenceHallDropdown(
                    callBackFunction: callBackConferenceHallName,
                    locationName: selectedLocation ?? ''),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              CheckboxListTile(
                tileColor: Colors.grey[200],
                title: const Text(
                  'Filter By Conference Room',
                  style: TextStyle(
                    color: Color(0xFF898383),
                    fontSize: 15,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                value: isCheckboxTicked,
                secondary: Icon(Icons.filter_list_alt),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckboxTicked = value!;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.black,
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.8,
                child: SfCalendar(
                  specialRegions: _getDisabledTimeRegions(),
                  // specialRegions: _disabledTimeRegions,
                  view: CalendarView.week,
                  dataSource: _getCalendarDataSource(),
                  minDate: DateTime.now(),
                  maxDate: DateTime.now().add(Duration(days: 30)),
                  timeSlotViewSettings: TimeSlotViewSettings(
                    startHour: 7,
                    endHour: 22,
                    timeInterval: const Duration(minutes: 15),
                    minimumAppointmentDuration: const Duration(minutes: 45),
                    timeFormat: 'h:ma',
                  ),

                  allowViewNavigation: false,
                  onTap: (calendarTapDetails) {
                    if (calendarTapDetails.targetElement ==
                        CalendarElement.appointment) {
                      final tappedAppointment =
                          calendarTapDetails.appointments!.first as Appointment;
                      _showEventDetailsDialog(tappedAppointment);
                    } else {
                      // Handle the calendar tap event for time range selection
                      handleCalendarTap(calendarTapDetails);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  void _showEventDetailsDialog(Appointment appointment) {
    // Format the start and end times to 12-hour clock with AM/PM
    String formattedStartTime =
        DateFormat('h:mm a').format(appointment.startTime);
    String formattedEndTime = DateFormat('h:mm a').format(appointment.endTime);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            //padding: EdgeInsets.all(16), // Add padding to the Container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('Event Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: screenWidth * 0.27,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 25.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  'Title: ${appointment.subject}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                    //color: Color.fromARGB(255, 202, 180, 101),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                // Column(
                //   children: [
                //     Text(' ${appointment.startTime}'),
                //     SizedBox(width: screenWidth * 0.005),
                //     const Text('to'),
                //     SizedBox(width: screenWidth * 0.005),
                //     Text(' ${appointment.endTime}'),
                //   ],
                // ),
                Row(
                  children: [
                    // SizedBox(
                    //     width:
                    //
                    //         8), // Add some spacing between the icon and text
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .av_timer, // Replace with the icon you want
                                color: Colors.grey,
                                //     0xFF696767), // Set the color of the icon
                                size: 20, // Set the size of the icon
                              ),
                              Text(
                                '${formattedStartTime} to ${formattedEndTime}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  //color: Color.fromARGB(255, 202, 180, 101),
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
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
