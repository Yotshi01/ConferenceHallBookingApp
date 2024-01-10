import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:intl/intl.dart';

class SyncfusionCalendarForEdit extends StatefulWidget {
  final BookingData currentBookingData;
  final bool? requestedEdit;
  final ReschedulingRequestResponseData? data;
  const SyncfusionCalendarForEdit(
      {Key? key,
      required this.currentBookingData,
      this.requestedEdit,
      this.data})
      : super(key: key);

  @override
  State<SyncfusionCalendarForEdit> createState() =>
      _SyncfusionCalendarForEditState();
}

class _SyncfusionCalendarForEditState extends State<SyncfusionCalendarForEdit> {
  // late Future<BookingDetails>
  //     bookingDetailsResponse; // Make bookingDetailsResponse a Future

  List<Appointment> _appointments =
      []; // Initialize an empty list of Appointments
  List<DateTime> specifiedDates = [];
  List<DateTime> specifiedBlackoutDates = [];
  BookingAlertDialog alertDialog = const BookingAlertDialog();

  DateTime? selectedStartTime;
  DateTime? selectedEndTime;

  List<TimeRegion> bookedTimeSlots = [];
  bool isConflicting = false;
  bool isCheckboxTicked = false;
  bool areAllDataSelected = false;
  bool showEditBookingButton = false;
  bool shouldDepartmentsInitiallyBeSelected = true;

  String? selectedLocation;
  String? selectedConferenceHall;
  final TabbarSetupState? tabbarSetupState = tabbarSetupKey.currentState;

  @override
  void initState() {
    super.initState();
    // bookingDetailsResponse = getBookingDetails(); // Initialize the Future here
    holidayDetailsResponse = getHolidayDetails();
    _fetchHolidayDetails();
    blackoutDaysDetailsResponse = getBlackoutDaysDetails();
    _fetchBlackoutDaysDetails();
    selectedLocation =
        getLocationName(widget.currentBookingData.bookingLocationId!);
    selectedConferenceHall =
        getConferenceHallName(widget.currentBookingData.bookingConferenceId);
    // listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking = listOfBookings;
    listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking =
        getBookingDataAccordingToSelectedLocationAndConferenceHall(
            selectedLocation!, selectedConferenceHall!);
    selectedStartTime = combineStringDateAndTimeIntoDateTimeFormat(
        widget.currentBookingData.bookingDate!,
        widget.currentBookingData.bookingStartTime!);
    selectedEndTime = combineStringDateAndTimeIntoDateTimeFormat(
        widget.currentBookingData.bookingDate!,
        widget.currentBookingData.bookingEndTime!);

    if (tabbarSetupState != null) {
      tabbarSetupState!.appBarTitle = 'Edit Booking Calendar';
    }
  }

  callBackLocationName(varSelectedLocation) {
    setState(() {
      selectedLocation = varSelectedLocation;
      // conferenceHallsAtSelectedLocation =
      //     getConferenceHallDataAccordingToSelectedLocation(varSelectedLocation);
      conferenceRoomChoosed = null;
      selectedConferenceHall = null;
    });
  }

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
          // print(listOfHolidays);
        }
      });
    } catch (error) {
      // print('Error fetching holiday list data: $error');
      throw Exception('Error fetching holiday list data: $error');
    }
  }

  Future<void> _fetchBlackoutDaysDetails() async {
    try {
      // bookingDetailsResponse = getBookingDetails();
      final BlackoutDaysDetails data = await blackoutDaysDetailsResponse;
      setState(() {
        if (data.data != null) {
          listOfBlackoutDays = data.data!.map((item) {
            return BlackoutDaysData.fromJson(item.toJson());
          }).toList();
          // print(listOfBlackoutDays);
        }
      });
    } catch (error) {
      // print('Error fetching blackout days list data: $error');
      throw Exception('Error fetching blackout days list data: $error');
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
    // print('vjhghhhhj');
    // List<BookingData> bookingDataList = [];
    // bookingDataList = listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking;

    // print(
    //     '${listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking} djkadnjzxc');
    if (listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking
        .isNotEmpty) {
      // print('ddfsfsd');

      // Generate a random color for each appointment
      // final Random random = Random();
      // final List<Color> appointmentColors = List.generate(
      //   listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking.length,
      //   (index) => Color.fromRGBO(
      //     random.nextInt(256),
      //     random.nextInt(256),
      //     random.nextInt(256),
      //     1.0,
      //   ),
      // );

      // Use a single color for all appointments (amber)
      const Color appointmentColor = Colors.amber;

      setState(() {
        _appointments =
            listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking
                .asMap()
                .entries
                .map((entry) {
          final data = entry.value;
          // final color = appointmentColors[entry.key];

          // Create a TimeRegion to represent the booked time slot
          final timeRegion = TimeRegion(
              startTime: DateTime.parse(
                  '${data.bookingDate!} ${data.bookingStartTime!}'),
              endTime: DateTime.parse(
                  '${data.bookingDate!} ${data.bookingEndTime!}'),
              // color: color, // Use the same color as the appointment
              color: Colors.amber[800]);

          if (data.bookingId != widget.currentBookingData.bookingId) {
            bookedTimeSlots.add(timeRegion); // Add the TimeRegion to the list
          }

          return Appointment(
              startTime: DateTime.parse(
                  '${data.bookingDate!} ${data.bookingStartTime!}'),
              endTime: DateTime.parse(
                  '${data.bookingDate!} ${data.bookingEndTime!}'),
              subject: data.bookingMeetingTitle!,
              id: data.bookingId,
              // color: color, // Use the random color
              color: appointmentColor);
        }).toList();
      });
      _appointments.removeWhere((appointment) =>
          appointment.id == widget.currentBookingData.bookingId);
    } else {
      _appointments = [];
    }
  }

  List<TimeRegion> _getDisabledTimeRegions() {
    List<TimeRegion> regions = <TimeRegion>[];

    // print(listOfHolidays);

    for (final nonWorkingDayDetails in listOfHolidays) {
      DateTime? nonWorkingDay =
          DateTime.tryParse(nonWorkingDayDetails.holidayDate!);
      specifiedDates.add(nonWorkingDay!);
      // print('${nonWorkingDay} ${nonWorkingDayDetails.holidayDate!}');
    }

    for (final blackoutDaysDetails in listOfBlackoutDays) {
      DateTime? blackoutDay =
          DateTime.tryParse(blackoutDaysDetails.blackoutDateDate!);
      specifiedBlackoutDates.add(blackoutDay!);
      // print('${blackoutDay} ${blackoutDaysDetails.blackoutDateDate!}');
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
        enablePointerInteraction: true, // Disables interaction with these dates
        textStyle: const TextStyle(
          color: Colors.red, // Customize the text color for disabled dates
          decoration: TextDecoration
              .lineThrough, // Add a line through the text for a strikeout effect
        ),
        color: Colors.green[300],
        //.withOpacity(0.2), // Set a background color for disabled dates
      ));
    }

    for (final date in specifiedBlackoutDates) {
      regions.add(TimeRegion(
        startTime: DateTime(date.year, date.month, date.day, 0, 0, 0),
        endTime: DateTime(date.year, date.month, date.day, 23, 59, 59),
        enablePointerInteraction:
            false, // Disables interaction with these dates
        textStyle: const TextStyle(
          color: Colors.red, // Customize the text color for disabled dates
          decoration: TextDecoration
              .lineThrough, // Add a line through the text for a strikeout effect
        ),
        color: Colors.black,
        //.withOpacity(0.2), // Set a background color for disabled dates
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
                  true, // Disables interaction with these dates
              textStyle: const TextStyle(
                color:
                    Colors.red, // Customize the text color for disabled dates
                decoration: TextDecoration
                    .lineThrough, // Add a line through the text for a strikeout effect
              ),
              color: Colors
                  .blueGrey[100], // Set a background color for disabled dates
            ));
          }
        } catch (e) {
          // Handle any potential date errors
        }
      }
    }

    // Add a region for the selected start time cell
    if (selectedStartTime != null) {
      regions.add(TimeRegion(
        startTime: selectedStartTime!,
        endTime: selectedStartTime!.add(
            const Duration(minutes: 30)), // Adjust duration for the cell size
        color: Colors.blue[600], // Customize the start time cell color
      ));
    }

// Add a region for the selected end time cell
    if (selectedEndTime != null) {
      regions.add(TimeRegion(
        startTime: selectedEndTime!.subtract(
            const Duration(minutes: 30)), // Adjust duration for the cell size
        endTime: selectedEndTime!,
        color: Colors.blue[600], // Customize the end time cell color
      ));
    }

    // Add a region for the selected time slot
    if (selectedStartTime != null && selectedEndTime != null) {
      regions.add(TimeRegion(
        startTime: selectedStartTime!.add(const Duration(minutes: 30)),
        endTime: selectedEndTime!.subtract(const Duration(minutes: 30)),
        color: Colors.blue.withOpacity(0.5), // Customize the color
      ));
    }

    // regions.add(TimeRegion(
    //   startTime: roundToNearest30Minutes(
    //       DateTime.now().subtract(Duration(minutes: 30))),
    //   endTime: roundToNearest30Minutes(DateTime.now()),
    //   enablePointerInteraction: false, // Disables interaction with these dates
    //   textStyle: const TextStyle(
    //     color: Colors.red, // Customize the text color for disabled dates
    //     decoration: TextDecoration
    //         .lineThrough, // Add a line through the text for a strikeout effect
    //   ),
    //   // color: Colors.grey[300],
    //   //.withOpacity(0.2), // Set a background color for disabled dates
    // ));

    // Add the booked time slots
    regions.addAll(bookedTimeSlots);

    // print(regions);
    return regions;
  }

  // void handleCalendarTap(CalendarTapDetails calendarTapDetails) {
  //   if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
  //     if (selectedStartTime == null) {
  //       setState(() {
  //         selectedStartTime = calendarTapDetails.date;
  //       });
  //     } else if (selectedEndTime == null) {
  //       setState(() {
  //         // selectedEndTime = calendarTapDetails.date!.add(Duration(minutes: 30));
  //         selectedEndTime = calendarTapDetails.date!;
  //         isConflicting = _isTimeRangeConflicting();
  //       });

  //       // print('${selectedStartTime} starrrrrrrrrrrrrrrrrrrrrrrt');
  //       // print(selectedEndTime);
  //       // Handle the selected time range (start time and end time) here.
  //     } else {
  //       setState(() {
  //         // selectedStartTime = null;
  //         selectedStartTime = calendarTapDetails.date;
  //         selectedEndTime = null;
  //       });
  //     }
  //   }
  // }

  void handleCalendarTap(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      if (selectedStartTime == null) {
        setState(() {
          selectedStartTime = calendarTapDetails.date;
          selectedEndTime = null; // Reset end time if
          showEditBookingButton = false;
        });
      } else if (selectedEndTime == null) {
        // Calculate the end time of the tapped box (1 hour later)
        DateTime calculatedEndTime =
            calendarTapDetails.date!.add(const Duration(minutes: 30));

        // Check if selected end time is after the start time
        if (calendarTapDetails.date!.isAfter(selectedStartTime!) &&
            (calculatedEndTime.year == selectedStartTime!.year &&
                calculatedEndTime.month == selectedStartTime!.month &&
                calculatedEndTime.day == selectedStartTime!.day)) {
          setState(() {
            selectedEndTime = calculatedEndTime;
            isConflicting = _isTimeRangeConflicting();
          });
          if (isConflicting == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Time Slot Unavailable'),
              ),
            );
            setState(() {
              showEditBookingButton = false;
            });
          } else {
            if (selectedLocation != null &&
                selectedConferenceHall != null &&
                selectedStartTime != null &&
                selectedEndTime != null) {
              setState(() {
                showEditBookingButton = true;
              });
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     backgroundColor: Colors.green[300],
              //     content: Text('Good to go!'),
              //   ),
              // );
            }
          }
        } else if (calculatedEndTime.year > selectedStartTime!.year ||
            (calculatedEndTime.year == selectedStartTime!.year &&
                calculatedEndTime.month > selectedStartTime!.month) ||
            (calculatedEndTime.year == selectedStartTime!.year &&
                calculatedEndTime.month == selectedStartTime!.month &&
                calculatedEndTime.day > selectedStartTime!.day)) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('Start Time and End time should be on the same day'),
          //   ),
          // );
          Fluttertoast.showToast(
              msg: 'Start Time and end time should be on the same day',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              // timeInSecForIos: 1,
              backgroundColor: Colors.grey[300],
              textColor: Colors.black);
          setState(() {
            // Selected end time is on a day after the start time
            selectedStartTime = calendarTapDetails.date;
            selectedEndTime = null;
            isConflicting = false; // Reset conflicting flag
            showEditBookingButton = false;
          });
        } else if (calendarTapDetails.date!.isBefore(selectedStartTime!) &&
            (calculatedEndTime.year == selectedStartTime!.year &&
                calculatedEndTime.month == selectedStartTime!.month &&
                calculatedEndTime.day == selectedStartTime!.day)) {
          setState(() {
            selectedEndTime =
                selectedStartTime!.add(const Duration(minutes: 30));
            selectedStartTime = calendarTapDetails.date;
            isConflicting = _isTimeRangeConflicting();
          });
          if (isConflicting == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Time Slot Unavailable'),
              ),
            );
            setState(() {
              showEditBookingButton = false;
            });
          } else {
            if (selectedLocation != null &&
                selectedConferenceHall != null &&
                selectedStartTime != null &&
                selectedEndTime != null) {
              setState(() {
                showEditBookingButton = true;
              });
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     backgroundColor: Colors.green[300],
              //     content: Text('Good to go!'),
              //   ),
              // );
            }
          }
        } else {
          // Handle case where end time is before start time (or same)
          setState(() {
            selectedStartTime = calendarTapDetails.date;
            selectedEndTime = null;
            isConflicting = false; // Reset conflicting flag
            showEditBookingButton = false;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('Start Time and End time should be on the same day'),
          //   ),
          // );
          Fluttertoast.showToast(
              msg: 'Start Time and end time should be on the same day',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              // timeInSecForIos: 1,
              backgroundColor: Colors.grey[300],
              textColor: Colors.black);
        }
      } else {
        // Both start and end times are selected, reset them
        setState(() {
          selectedStartTime = calendarTapDetails.date;
          selectedEndTime = null;
          isConflicting = false; // Reset conflicting flag
          showEditBookingButton = false;
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
    // print(
    //     '${selectedLocation} this is the start of the process of filtering using location');
    // print(
    //     '${selectedConferenceHall} this is the start of the process of filtering using conference hall');
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Event Calendar'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      body: Column(
        children: [
          // Align(
          //     alignment: Alignment.topLeft,
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(
          //           horizontal: screenWidth * 0.01,
          //           vertical: screenHeight * 0.01),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           // Navigator.of(context).pop();
          //           navigatorKeys[BottomNavBarItem.home]!.currentState!.pop();
          //         },
          //         style: ElevatedButton.styleFrom(
          //           shape:
          //               CircleBorder(), // Use CircleBorder to make the button circular
          //           backgroundColor: Colors.grey[
          //               300], // Change the button color to your preference
          //           padding:
          //               EdgeInsets.all(11.0), // Adjust the padding as needed
          //         ),
          //         child: Icon(
          //           Icons
          //               .arrow_back, // You can use your preferred edit icon here
          //           color: Colors
          //               .black, // Change the icon color to your preference
          //         ),
          //       ),
          //     )),
          // SizedBox(
          //   height: screenHeight * 0.01,
          // ),
          // if (showEditBookingButton == true &&
          //     selectedLocation != null &&
          //     selectedConferenceHall != null)

          const SizedBox(
            width: 20,
          ),
          LocationsDropdown(
              callBackFunction: callBackLocationName,
              initialSelectedLocation: getLocationName(
                  widget.currentBookingData.bookingLocationId!)),
          SizedBox(
            height: screenHeight * 0.007,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if (selectedLocation != null)
                  ConferenceHallDropdown(
                      callBackFunction: callBackConferenceHallName,
                      locationName: selectedLocation ?? '',
                      initialSelectedConferenceHall: getConferenceHallName(
                          widget.currentBookingData.bookingConferenceId)),
                if (selectedLocation != null)
                  IconButton(
                    icon: const Icon(
                      Icons.info,
                      color: Color.fromARGB(255, 236, 219, 158),
                      size: 35,
                    ),
                    onPressed: () {
                      if (selectedConferenceHall != null) {
                        _showDetailsDialog();
                      } else {
                        // Handle case when no hall is selected
                      }
                    },
                  ),
              ],
            ), // if (isCheckboxTicked == true)
          ),
          // if (isCheckboxTicked == true)

          SizedBox(
            height: screenHeight * 0.01,
          ),

          // Transform.scale(
          //   scale: 0.8,
          //   child: CheckboxListTile(
          //     tileColor: Colors.grey[200],
          //     title: const Text(
          //       'Filter By Conference Room',
          //       style: TextStyle(
          //         color: Color(0xFF898383),
          //         fontSize: 17,
          //         fontFamily: 'Noto Sans',
          //         fontWeight: FontWeight.w400,
          //         //height: 0,
          //       ),
          //     ),
          //     value: isCheckboxTicked,
          //     secondary: Icon(Icons.filter_list_alt),
          //     controlAffinity: ListTileControlAffinity.leading,
          //     onChanged: (bool? value) {
          //       setState(() {
          //         isCheckboxTicked = value!;
          //       });
          //     },
          //     activeColor: Colors.green,
          //     checkColor: Colors.black,
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          Expanded(
            child: SfCalendar(
              initialDisplayDate: combineStringDateAndTimeIntoDateTimeFormat(
                  widget.currentBookingData.bookingDate!,
                  widget.currentBookingData.bookingStartTime!),
              // headerHeight: 0,
              // viewHeaderHeight: 0,
              specialRegions: _getDisabledTimeRegions(),
              // specialRegions: _disabledTimeRegions,
              view: CalendarView.week,
              dataSource: _getCalendarDataSource(),
              minDate: roundToNext30Or60Minutes(DateTime.now()),
              maxDate: DateTime.now().add(const Duration(days: 30)),
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 8,
                endHour: 22,
                timeInterval: Duration(minutes: 30),
                minimumAppointmentDuration: Duration(minutes: 30),
                timeFormat: 'h:mm a',
              ),

              allowViewNavigation: false,
              // headerDateFormat: 'MMM,yyy',

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
          ),
          // Stack(
          //   children: [
          //     Align(
          //         alignment: Alignment.topRight,
          //         child: ShaderMask(
          //           shaderCallback: (Rect bounds) {
          //             return LinearGradient(
          //               colors: [
          //                 Colors.red,
          //                 Colors.orange,
          //                 Colors.yellow,
          //                 Colors.green,
          //                 Colors.blue,
          //                 Colors.indigo,
          //                 Colors.purple,
          //               ],
          //               stops: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7],
          //               begin: Alignment.bottomLeft,
          //               end: Alignment.topRight,
          //             ).createShader(bounds);
          //           },
          //           child: Icon(
          //             Icons.circle,
          //             size: 50.0,
          //             color: Colors.white,
          //           ),
          //         )),
          //     SfCalendar(
          //       initialDisplayDate: combineStringDateAndTimeIntoDateTimeFormat(
          //           widget.currentBookingData.bookingDate!,
          //           widget.currentBookingData.bookingStartTime!),
          //       // headerHeight: 0,
          //       // viewHeaderHeight: 0,
          //       specialRegions: _getDisabledTimeRegions(),
          //       // specialRegions: _disabledTimeRegions,
          //       view: CalendarView.week,
          //       dataSource: _getCalendarDataSource(),
          //       minDate: DateTime.now(),
          //       maxDate: DateTime.now().add(Duration(days: 30)),
          //       timeSlotViewSettings: TimeSlotViewSettings(
          //         startHour: 8,
          //         endHour: 22,
          //         timeInterval: const Duration(minutes: 30),
          //         minimumAppointmentDuration: const Duration(minutes: 30),
          //         timeFormat: 'h:mm a',
          //       ),

          //       allowViewNavigation: false,
          //       headerDateFormat: 'MMM,yyy',

          //       onTap: (calendarTapDetails) {
          //         if (calendarTapDetails.targetElement ==
          //             CalendarElement.appointment) {
          //           final tappedAppointment =
          //               calendarTapDetails.appointments!.first as Appointment;
          //           _showEventDetailsDialog(tappedAppointment);
          //         } else {
          //           // Handle the calendar tap event for time range selection
          //           handleCalendarTap(calendarTapDetails);
          //         }
          //       },
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 15,
                    height: 15,
                    color: Colors.green,
                  ),
                  const SizedBox(
                      width:
                          5), // Adjust the spacing between the square and the text
                  const Text(
                    'Holiday',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 13),
                  Container(
                    width: 15,
                    height: 15,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(
                      width:
                          5), // Adjust the spacing between the square and the text
                  const Text(
                    'Sunday',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                      width:
                          5), // Adjust the spacing between the square and the text
                  const Text(
                    'Past',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 13),
                  Container(
                    width: 15,
                    height: 15,
                    color: Colors.black,
                  ),
                  const SizedBox(
                      width:
                          5), // Adjust the spacing between the square and the text
                  const Text(
                    'Blackout Day',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
              // SizedBox(width: 13),
            ],
          ),
          const SizedBox(
            height: 8,
          ),

          // SizedBox(
          //   height: 8,
          // ),
          Container(
            width: screenWidth * 0.95,
            height: screenHeight * 0.07,
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 7,
                ),
                const Expanded(
                  child: Text(
                    'Continue editing by tapping in edit button',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    //backgroundColor: Color.fromARGB(255, 241, 231, 195),
                    mini: true,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
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
                      setState(() {
                        isConflicting = _isTimeRangeConflicting();
                      });

                      if (selectedStartTime != null &&
                          selectedEndTime != null) {
                        final Duration duration =
                            (selectedEndTime!.difference(selectedStartTime!))
                                .abs();
                        if (duration < const Duration(minutes: 60)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'The selected duration should be atleast 60 minutes'),
                            ),
                          );
                        } else if (selectedStartTime!
                            .isAfter(selectedEndTime!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Start Time should be before End Time'),
                            ),
                          );
                        } else if ((selectedStartTime!.year ==
                                    selectedEndTime!.year &&
                                selectedStartTime!.month ==
                                    selectedEndTime!.month &&
                                selectedStartTime!.day ==
                                    selectedEndTime!.day) ==
                            false) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //         'Start Time and end time should be on the same day'),
                          //   ),
                          // );
                          Fluttertoast.showToast(
                              msg:
                                  'Start Time and end time should be on the same day',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              // timeInSecForIos: 1,
                              backgroundColor: Colors.grey[300],
                              textColor: Colors.black);
                        } else if (isConflicting == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
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

                          if (selectedLocation != null &&
                              selectedConferenceHall != null) {
                            // print('${selectedStartTime} sjxsaxkxx');
                            if (widget.currentBookingData.bookingLocationId !=
                                getLocationId(selectedLocation!)) {
                              setState(() {
                                shouldDepartmentsInitiallyBeSelected = false;
                              });
                            } else {
                              setState(() {
                                shouldDepartmentsInitiallyBeSelected = true;
                              });
                            }
                            await navigatorKeys[BottomNavBarItem.home]!
                                .currentState!
                                .push(
                                  MaterialPageRoute(
                                      builder: (context) => EditBooking(
                                          selectedStartTime: selectedStartTime ??
                                              DateTime
                                                  .now(), // Provide a default value or handle null appropriately

                                          selectedEndTime:
                                              selectedEndTime ?? DateTime.now(),
                                          selectedLocation: selectedLocation!,
                                          selectedConferenceHall:
                                              selectedConferenceHall!,
                                          currentBookingData:
                                              widget.currentBookingData,
                                          requestedEdit: widget.requestedEdit,
                                          data: widget.data,
                                          shouldDepartmentsInitiallyBeSelected:
                                              shouldDepartmentsInitiallyBeSelected)),
                                );

                            // Clear the selected times for the next selection
                            // selectedStartTime = null;
                            // selectedEndTime = null;

                            // await Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => EditBooking(
                            //               selectedStartTime: selectedStartTime ??
                            //                   DateTime
                            //                       .now(), // Provide a default value or handle null appropriately

                            //               selectedEndTime: selectedEndTime ??
                            //                   DateTime.now(),

                            //               selectedLocation: selectedLocation!,
                            //               selectedConferenceHall:
                            //                   selectedConferenceHall!,
                            //               currentBookingData:
                            //                   widget.currentBookingData,
                            //             )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please select both location and conference hall to add booking'),
                              ),
                            );
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select your time slot to add a booking'),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
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
                    const Text('Event Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: screenWidth * 0.2,
                    ),
                    // Spacer(),
                    IconButton(
                      icon: const Icon(
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
                  style: const TextStyle(
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons
                                    .av_timer, // Replace with the icon you want
                                color: Colors.grey,
                                //     0xFF696767), // Set the color of the icon
                                size: 20, // Set the size of the icon
                              ),
                              Text(
                                '${formattedStartTime} to ${formattedEndTime}',
                                style: const TextStyle(
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

  void _showDetailsDialog() {
    ConferenceHallData currentSelectedConferenceHall = ConferenceHallData();
    currentSelectedConferenceHall =
        getConferenceHallDataByName(selectedConferenceHall!);
    String conferenceHallImageName =
        getConferenceHallImageName(currentSelectedConferenceHall.conferenceId!);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            selectedConferenceHall!,
            style: const TextStyle(color: Colors.brown),
          ),
          backgroundColor: Colors.amber[50],
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text("conferenceHallDetails"),
                // Align(
                //   alignment: Alignment.center,
                //   child: Image.asset(
                //     "assets/images/conference_hall_images/${conferenceHallImageName}",
                //     width: screenWidth * 0.24,
                //     height: screenHeight * 0.15,
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    "${liveBaseUrl}/uploads/conferences/${conferenceHallImageName}",
                    width: screenWidth * 0.24,
                    height: screenHeight * 0.15,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                ),
                const SizedBox(height: 10),
                //Text("${currentSelectedConferenceHall.conferenceName}"),
                const Text(
                  "About Room",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Divider(),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "${currentSelectedConferenceHall.conferenceAboutRoom}",
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    // Add more styling properties as needed
                  ),
                  //textAlign: TextAlign.left,
                ),
                const SizedBox(height: 14),
                const Text(
                  "Other details",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Divider(),
                Text(
                  "Seating Capacity: ${currentSelectedConferenceHall.conferenceSeatingCapacity}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.bold
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  "Audio System: ${currentSelectedConferenceHall.conferenceAudioSystem}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.bold
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Laptops Availability: ${currentSelectedConferenceHall.conferenceLaptop}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.bold
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  "Mic Availability: ${currentSelectedConferenceHall.conferenceMic}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.bold
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  "Others: ${currentSelectedConferenceHall.conferenceOther}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.bold
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  "Seating Type: ${currentSelectedConferenceHall.conferenceSeatingType}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Text(
                  "Whiteboard: ${currentSelectedConferenceHall.conferenceWhiteboard}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    // Add more styling properties as needed
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
