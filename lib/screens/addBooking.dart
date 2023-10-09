import 'package:conference_hall_booking/api/conference_hall_details_api.dart';
import 'package:conference_hall_booking/api/location_details_api.dart';
import 'package:conference_hall_booking/models/conference_hall_details.dart';
import 'package:conference_hall_booking/models/locations.dart';
import 'package:conference_hall_booking/utils/conference_hall_dropdown.dart';
import 'package:conference_hall_booking/utils/locations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:intl/intl.dart';
import 'package:conference_hall_booking/models/events.dart';
import 'package:conference_hall_booking/api/booking_details_api.dart';

class AddBooking extends StatefulWidget {
  const AddBooking({super.key});

  @override
  State<AddBooking> createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  TextEditingController _meetingTitleController = TextEditingController();
  TextEditingController _meetingDescriptionController = TextEditingController();

  DateTime? selectedDate;
  DateTime dateTime = DateTime(2022, 12, 24);
  TimeOfDay? selectedStartTime;
  TimeOfDay printedStartTime = TimeOfDay(hour: 4, minute: 24);
  TimeOfDay? selectedEndTime;
  TimeOfDay printedEndTime = TimeOfDay(hour: 4, minute: 24);

  // @override
  // void initState() {
  //   super.initState();
  //   conferenceHallDetailsResponse = getConferenceHallDetails();
  //   _fetchConferenceHallData();
  // }

  Future<void> _addBooking() async {
    // Create a BookingDetails object with the data you want to add
    BookingDetails newBooking = BookingDetails(
      data: [BookingData.fromJson({/* ... */})], // Add the data as needed
    );

    try {
      // Call the addBookingDetails function to add the booking
      BookingDetails addedBooking = await addBookingDetails(newBooking);
      // Handle the response as needed
      print('Booking added: ${addedBooking.toJson()}');
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print('Error adding booking: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Booking Page'),
        ),
        body: Container(
          // width: screenWidth * 0.8,
          // height: screenHeight * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final date = await _selectedDate(context);
                      if (date == null) return;
                      setState(() {
                        dateTime = date;
                        selectedDate = date;
                      });
                      print(date);
                    },
                    child: Text(selectedDate != null
                        ? '${dateTime.year}-${dateTime.month}-${dateTime.day}'
                        : 'Select Date'),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final time = await _selectedTime(context);
                      if (time == null) return;
                      print(selectedStartTime);
                      setState(() {
                        printedStartTime = time;
                        selectedStartTime = time;
                      });
                    },
                    child: Text(selectedStartTime != null
                        ? '${printedStartTime.hour} ${printedStartTime.minute}'
                        : 'Select Time'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final time = await _selectedTime(context);
                      if (time == null) return;
                      print(selectedEndTime);
                      setState(() {
                        printedEndTime = time;
                        selectedEndTime = time;
                      });
                    },
                    child: Text(selectedEndTime != null
                        ? '${printedEndTime.hour} ${printedEndTime.minute}'
                        : 'Select Time'),
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
              LocationsDropdown(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ConferenceHallDropdown(),
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
                controller: _meetingTitleController,
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
                controller: _meetingDescriptionController,
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
        ));
  }

  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  Future<DateTime?> _selectedDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}
