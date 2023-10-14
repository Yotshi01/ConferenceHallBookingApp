import 'package:conference_hall_booking/api/conference_hall_details_api.dart';
import 'package:conference_hall_booking/api/location_details_api.dart';
import 'package:conference_hall_booking/models/conference_hall_details.dart';
import 'package:conference_hall_booking/models/locations.dart';
import 'package:conference_hall_booking/screens/syncfusion_calendar.dart';
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
  TextEditingController _otherDetailsController = TextEditingController();

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

  // Future<void> _addBooking() async {
  //   // Create a BookingDetails object with the data you want to add
  //   BookingDetails newBooking = BookingDetails(
  //     data: [BookingData.fromJson({/* ... */})], // Add the data as needed
  //   );

  //   try {
  //     // Call the addBookingDetails function to add the booking
  //     BookingDetails addedBooking = await addBookingDetails(newBooking);
  //     // Handle the response as needed
  //     print('Booking added: ${addedBooking.toJson()}');
  //   } catch (e) {
  //     // Handle any errors that occur during the HTTP request
  //     print('Error adding booking: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Booking Page'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              // width: 352,
              // height: 641,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/meeting-room5.png",
                                width: screenWidth * 0.24,
                                height: screenHeight * 0.15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Meeting Title',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      SizedBox(
                        width: 300,
                        // height: 25,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 1), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Use a light gray color
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value as needed
                          ),
                          child: TextField(
                            controller: _meetingTitleController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Noto Sans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default TextField border
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons
                      //           .pin_drop_outlined, // Replace with the icon you want
                      //       color: Colors
                      //           .yellow, // Set the color of the icon
                      //       size: 24, // Set the size of the icon
                      //     ),
                      //     // SizedBox(
                      //     //     width:
                      //     //         8), // Add some spacing between the icon and text

                      //   ],
                      // ),
                      LocationsDropdown(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Conference Room Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      // Text(
                      //   widget.currentConferenceRoomName,
                      //   style: TextStyle(
                      //     color: Color(0xFFB88D05),
                      //     fontSize: 16,
                      //     fontFamily: 'Noto Sans',
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      ConferenceHallDropdown(),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            final date = await _selectedDate(context);
                            if (date == null) return;
                            setState(() {
                              dateTime = date;
                              selectedDate = date;
                              toBeAddedBookingData.bookingDate =
                                  selectedDate.toString();
                            });
                            print(date);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(300,
                                50), // Adjust the width and height as needed
                            primary: Colors.grey[
                                200], // Set the background color to light gray
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the value as needed
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .calendar_month, // Replace with the icon you want
                                color: Color(
                                    0xFF696767), // Set the color of the icon
                                size: 24, // Set the size of the icon
                              ),
                              SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              Text(
                                selectedDate != null
                                    ? '${dateTime.year}-${dateTime.month}-${dateTime.day}'
                                    :
                                    // controller: _meetingTitleController,
                                    'Select Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Timing',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons
                          //       .av_timer, // Replace with the icon you want
                          //   color: Color(
                          //       0xFF696767), // Set the color of the icon
                          //   size: 24, // Set the size of the icon
                          // ),
                          // SizedBox(
                          //     width:
                          //         8), // Add some spacing between the icon and text

                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () async {
                                // Handle button tap here
                                print('Button tapped');
                                final time = await _selectedTime(context);
                                if (time == null) return;
                                print(selectedStartTime);
                                setState(() {
                                  printedStartTime = time;
                                  selectedStartTime = time;
                                  toBeAddedBookingData.strTime =
                                      '${selectedStartTime!.hour.toString().padLeft(2, '0')}:${selectedStartTime!.minute.toString().padLeft(2, '0')}';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100,
                                    50), // Adjust the width and height as needed
                                primary: Colors.grey[
                                    200], // Set the background color to light gray
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the value as needed
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons
                                        .av_timer, // Replace with the icon you want
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 24, // Set the size of the icon
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  Text(
                                    // controller: _meetingTitleController,
                                    selectedStartTime != null
                                        ? '${printedStartTime.hour.toString().padLeft(2, '0')}:${printedStartTime.minute.toString().padLeft(2, '0')}'
                                        : 'Start Time',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Text(
                              'to ',
                              style: TextStyle(
                                color: Color(0xFF696767),
                                fontSize: 12,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () async {
                                // Handle button tap here
                                print('Button tapped');
                                final time = await _selectedTime(context);
                                if (time == null) return;
                                print(selectedEndTime);
                                setState(() {
                                  printedEndTime = time;
                                  selectedEndTime = time;
                                  toBeAddedBookingData.endTime =
                                      '${selectedEndTime!.hour.toString().padLeft(2, '0')}:${selectedEndTime!.minute.toString().padLeft(2, '0')}';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100,
                                    50), // Adjust the width and height as needed
                                primary: Colors.grey[
                                    200], // Set the background color to light gray
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the value as needed
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons
                                        .av_timer, // Replace with the icon you want
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 24, // Set the size of the icon
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Add some spacing between the icon and text
                                  Text(
                                    // controller: _meetingTitleController,
                                    selectedEndTime != null
                                        ? '${printedEndTime.hour.toString().padLeft(2, '0')}:${printedEndTime.minute.toString().padLeft(2, '0')}'
                                        : 'End Time',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Meeting Description',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      SizedBox(
                        width: 300,
                        // height: 25,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 1), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Use a light gray color
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value as needed
                          ),
                          child: TextField(
                            controller: _meetingDescriptionController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Noto Sans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default TextField border
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Other Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Color(
                            0xFFC2C0C0), // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      SizedBox(
                        width: 300,
                        // height: 25,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 1), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Use a light gray color
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value as needed
                          ),
                          child: TextField(
                            controller: _otherDetailsController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Noto Sans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder
                                  .none, // Remove the default TextField border
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // if(currentUserData!.id == widget.currentBookingData)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SyncfusionCalendar()));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape:
                                  CircleBorder(), // Use CircleBorder to make the button circular
                              backgroundColor: Colors
                                  .red, // Change the button color to your preference
                              padding: EdgeInsets.all(
                                  16.0), // Adjust the padding as needed
                            ),
                            child: Icon(
                              Icons
                                  .cancel, // You can use your preferred edit icon here
                              color: Colors
                                  .white, // Change the icon color to your preference
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                // toBeUpdatedBookingData.bookingId =
                                //     widget.currentBookingData
                                //         .bookingId;
                                toBeAddedBookingData.meetingTitle =
                                    _meetingTitleController.text;
                                toBeAddedBookingData.meetingDes =
                                    _meetingDescriptionController.text;
                                toBeAddedBookingData.otherDetails =
                                    _otherDetailsController.text;
                                toBeAddedBookingData.createdAt =
                                    DateTime.now().toString();
                                toBeAddedBookingData.bookingStatus = 'Active';
                                toBeAddedBookingData.userId =
                                    currentUserData!.id;
                              });

                              var response =
                                  await addBooking(toBeAddedBookingData);

                              if (response.status == 'success') {
                                SnackBar(
                                  content: Text("Booking added successfully!"),
                                );
                              } else {
                                SnackBar(
                                  content: Text("Failed to add booking"),
                                );
                              }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SyncfusionCalendar()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape:
                                  CircleBorder(), // Use CircleBorder to make the button circular
                              backgroundColor: Colors
                                  .green, // Change the button color to your preference
                              padding: EdgeInsets.all(
                                  16.0), // Adjust the padding as needed
                            ),
                            child: Icon(
                              Icons
                                  .check, // You can use your preferred edit icon here
                              color: Colors
                                  .white, // Change the icon color to your preference
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              )),
        ));
  }

  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.inputOnly,
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
