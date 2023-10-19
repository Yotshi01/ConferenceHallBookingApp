//import 'package:flutter/material.dart';
//import 'package:conference_hall_booking/reusables/reusable_widgets.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';

class DetailsScreen extends StatefulWidget {
  final BookingData currentBookingData;
  final String currentConferenceRoomName;
  final String currentLocationName;
  const DetailsScreen(
      {Key? key,
      required this.currentBookingData,
      required this.currentConferenceRoomName,
      required this.currentLocationName})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _snackChecked = false;
  bool _biscuitChecked = false;
  bool _coffeeChecked = false;
  bool _teaChecked = false;
  int _snackQuantity = 0;
  int _biscuitQuantity = 0;
  int _coffeeQuantity = 0;
  int _teaQuantity = 0;
  get onPressed => null;
  bool isEditable = false;
  TextEditingController _meetingTitleController = TextEditingController();
  TextEditingController _meetingDescriptionController = TextEditingController();
  TextEditingController _otherDetailsController = TextEditingController();
  DateTime? selectedDate;
  DateTime dateTime = DateTime(2022, 12, 24);
  TimeOfDay? selectedStartTime;
  TimeOfDay printedStartTime = TimeOfDay(hour: 4, minute: 24);
  TimeOfDay? selectedEndTime;
  TimeOfDay printedEndTime = TimeOfDay(hour: 4, minute: 24);

  String? selectedLocation;
  callBack(varSelectedLocation) {
    setState(() {
      selectedLocation = varSelectedLocation;
    });
  }

  Future<DateTime?> _selectedDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.inputOnly,
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  @override
  void initState() {
    _meetingTitleController =
        TextEditingController(text: widget.currentBookingData.meetingTitle);
    _meetingDescriptionController =
        TextEditingController(text: widget.currentBookingData.meetingDes);
    _otherDetailsController =
        TextEditingController(text: widget.currentBookingData.otherDetails);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Detail',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.25,
              letterSpacing: 0.16,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                  bottom: screenHeight * 0.03,
                ),
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.21, -0.98),
                    end: Alignment(-0.21, 0.98),
                    colors: [Colors.white, Color(0x00DBCC95)],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),

                    // SizedBox(
                    //   height: screenHeight * 0.02,
                    // ),
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 352,
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
                            if (isEditable == false)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (currentUserData!.id ==
                                      widget.currentBookingData.userId)
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isEditable = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape:
                                            CircleBorder(), // Use CircleBorder to make the button circular
                                        backgroundColor: Colors
                                            .blue, // Change the button color to your preference
                                        padding: EdgeInsets.all(
                                            16.0), // Adjust the padding as needed
                                      ),
                                      child: Icon(
                                        Icons
                                            .edit, // You can use your preferred edit icon here
                                        color: Colors
                                            .white, // Change the icon color to your preference
                                      ),
                                    ),
                                  Container(),
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
                                    '${widget.currentBookingData.meetingTitle}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w700,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Divider(
                                    color: Color(
                                        0xFFC2C0C0), // Set the color of the divider line
                                    thickness:
                                        1, // Set the thickness of the divider line
                                  ),

                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.currentConferenceRoomName,
                                      style: TextStyle(
                                        color: Color(0xFFB88D05),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons
                                            .calendar_month, // Replace with the icon you want
                                        color: Color(
                                            0xFF696767), // Set the color of the icon
                                        size: 20, // Set the size of the icon
                                      ),
                                      // SizedBox(
                                      //     width:
                                      //         8), // Add some spacing between the icon and text
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                '${widget.currentBookingData.bookingDate}',
                                                style: TextStyle(
                                                  color: Color(0xFF696767),
                                                  fontSize: 12,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ))),
                                      SizedBox(
                                        width: screenWidth * 0.05,
                                      ),
                                      Icon(
                                        Icons
                                            .av_timer, // Replace with the icon you want
                                        color: Color(
                                            0xFF696767), // Set the color of the icon
                                        size: 20, // Set the size of the icon
                                      ),
                                      // SizedBox(
                                      //     width:
                                      //         8), // Add some spacing between the icon and text
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                '${widget.currentBookingData.strTime} to ${widget.currentBookingData.endTime}',
                                                style: TextStyle(
                                                  color: Color(0xFF696767),
                                                  fontSize: 12,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )))
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons
                                            .pin_drop_outlined, // Replace with the icon you want
                                        color: Color(0xFF696767),
                                        size: 20, // Set the size of the icon
                                      ),
                                      // SizedBox(
                                      //     width:
                                      //         8), // Add some spacing between the icon and text
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                widget.currentLocationName,
                                                style: TextStyle(
                                                  color: Color(0xFF696767),
                                                  fontSize: 14,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )))
                                    ],
                                  ),
                                  // Text(
                                  //   'Location',
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 14,
                                  //     fontFamily: 'Noto Sans',
                                  //     fontWeight: FontWeight.w700,
                                  //   ),
                                  // ),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  //),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),

                                  Text(
                                    '${widget.currentBookingData.meetingDes}',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  Text(
                                    'About Room',
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
                                    thickness:
                                        1, // Set the thickness of the divider line
                                  ),
                                  Text(
                                    getConferenceHallDescription(widget
                                        .currentBookingData.conferenceName!),
                                    style: TextStyle(
                                      color: Colors.grey[850],
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
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
                                    thickness:
                                        1, // Set the thickness of the divider line
                                  ),
                                  Text(
                                    '${widget.currentBookingData.otherDetails}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Noto Sans',
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: MeetingUpdateButtons(
                                      bookingUserId:
                                          widget.currentBookingData.userId!,
                                    ),
                                  ),
                                ],
                              )
                            else
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Meeting Title',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
                                  SizedBox(height: screenHeight * 0.01),
                                  SizedBox(
                                    width: 300,
                                    // height: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical:
                                              1), // Adjust the padding as needed
                                      decoration: BoxDecoration(
                                        color: Colors.grey[
                                            200], // Use a light gray color
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Location',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
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
                                  LocationsDropdown(callBackFunction: callBack),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Conference Room Name',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
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
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
                                  SizedBox(
                                    width: 300,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final date =
                                            await _selectedDate(context);
                                        if (date == null) return;
                                        setState(() {
                                          dateTime = date;
                                          selectedDate = date;
                                          toBeUpdatedBookingData.bookingDate =
                                              selectedDate.toString();
                                        });
                                        print(date);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(300,
                                            50), // Adjust the width and height as needed
                                        backgroundColor: Colors.grey[
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
                                            size:
                                                24, // Set the size of the icon
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // Add some spacing between the icon and text
                                          Text(
                                            selectedDate != null
                                                ? '${dateTime.year}-${dateTime.month}-${dateTime.day}'
                                                :
                                                // controller: _meetingTitleController,
                                                '${widget.currentBookingData.bookingDate}',
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Timing',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            // Handle button tap here
                                            print('Button tapped');
                                            final time =
                                                await _selectedTime(context);
                                            if (time == null) return;
                                            print(selectedStartTime);
                                            setState(() {
                                              printedStartTime = time;
                                              selectedStartTime = time;
                                              toBeUpdatedBookingData.strTime =
                                                  '${selectedStartTime!.hour.toString().padLeft(2, '0')}:${selectedStartTime!.minute.toString().padLeft(2, '0')}';
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100,
                                                50), // Adjust the width and height as needed
                                            backgroundColor: Colors.grey[
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
                                                size:
                                                    24, // Set the size of the icon
                                              ),
                                              SizedBox(
                                                  width:
                                                      8), // Add some spacing between the icon and text
                                              Text(
                                                // controller: _meetingTitleController,
                                                selectedStartTime != null
                                                    ? '${printedStartTime.hour.toString().padLeft(2, '0')}:${printedStartTime.minute.toString().padLeft(2, '0')}'
                                                    : '${widget.currentBookingData.strTime}',
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
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            // Handle button tap here
                                            print('Button tapped');
                                            final time =
                                                await _selectedTime(context);
                                            if (time == null) return;
                                            print(selectedEndTime);
                                            setState(() {
                                              printedEndTime = time;
                                              selectedEndTime = time;
                                              toBeUpdatedBookingData.endTime =
                                                  '${selectedEndTime!.hour.toString().padLeft(2, '0')}:${selectedEndTime!.minute.toString().padLeft(2, '0')}';
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(100,
                                                50), // Adjust the width and height as needed
                                            backgroundColor: Colors.grey[
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
                                                size:
                                                    24, // Set the size of the icon
                                              ),
                                              SizedBox(
                                                  width:
                                                      8), // Add some spacing between the icon and text
                                              Text(
                                                // controller: _meetingTitleController,
                                                selectedEndTime != null
                                                    ? '${printedEndTime.hour.toString().padLeft(2, '0')}:${printedEndTime.minute.toString().padLeft(2, '0')}'
                                                    : '${widget.currentBookingData.endTime}',
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Meeting Description',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
                                  SizedBox(
                                    width: 300,
                                    // height: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical:
                                              1), // Adjust the padding as needed
                                      decoration: BoxDecoration(
                                        color: Colors.grey[
                                            200], // Use a light gray color
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the value as needed
                                      ),
                                      child: TextField(
                                        controller:
                                            _meetingDescriptionController,
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Other Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  // Divider(
                                  //   color: Color(
                                  //       0xFFC2C0C0), // Set the color of the divider line
                                  //   thickness:
                                  //       1, // Set the thickness of the divider line
                                  // ),
                                  SizedBox(
                                    width: 300,
                                    // height: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical:
                                              1), // Adjust the padding as needed
                                      decoration: BoxDecoration(
                                        color: Colors.grey[
                                            200], // Use a light gray color
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Facilities',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    height: 210,
                                    // height: 25,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical:
                                              1), // Adjust the padding as needed
                                      decoration: BoxDecoration(
                                        color: Colors.grey[
                                            200], // Use a light gray color
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the value as needed
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: MeetingUpdateButtons(
                                      bookingUserId:
                                          widget.currentBookingData.userId!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // if(currentUserData!.id == widget.currentBookingData)
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            isEditable = false;
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
                                            toBeUpdatedBookingData.bookingId =
                                                widget.currentBookingData
                                                    .bookingId;
                                            toBeUpdatedBookingData
                                                    .meetingTitle =
                                                _meetingTitleController.text;
                                            toBeUpdatedBookingData.meetingDes =
                                                _meetingDescriptionController
                                                    .text;
                                            toBeUpdatedBookingData
                                                    .otherDetails =
                                                _otherDetailsController.text;
                                            toBeUpdatedBookingData.updatedAt =
                                                DateTime.now().toString();
                                          });

                                          var response = await updateBooking(
                                              toBeUpdatedBookingData);

                                          if (response.status == 'success') {
                                            SnackBar(
                                              content: Text(
                                                  "Booking updated successfully!"),
                                            );
                                          } else {
                                            SnackBar(
                                              content: Text(
                                                  "Failed to update booking"),
                                            );
                                          }
                                          isEditable = false;
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
                  ],
                ))));
  }

  Widget _buildCheckboxRow(String label, bool checked, int quantity) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: (value) {
            setState(() {
              if (label == 'Snack') {
                _snackChecked = value!;
              } else if (label == 'Biscuit') {
                _biscuitChecked = value!;
              } else if (label == 'Coffee') {
                _coffeeChecked = value!;
              } else if (label == 'Tea') {
                _teaChecked = value!;
              }
            });
          },
        ),
        Text(label),
        if (checked)
          GestureDetector(
            onTap: () {
              _showQuantityDialog(label);
            },
            child: Text(' ($quantity)'),
          ),
      ],
    );
  }

  void _showQuantityDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int quantity;
        if (item == 'Snack') {
          quantity = _snackQuantity;
        } else if (item == 'Biscuit') {
          quantity = _biscuitQuantity;
        } else if (item == 'Coffee') {
          quantity = _coffeeQuantity;
        } else if (item == 'Tea') {
          quantity = _teaQuantity;
        } else {
          // Provide a default value for the 'quantity' variable
          quantity = 0;
        }

        return AlertDialog(
          title: Text('Select Quantity for $item'),
          content: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    quantity = (quantity - 1).clamp(0, 99);
                  });
                },
              ),
              Text('$quantity'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity = (quantity + 1).clamp(0, 99);
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  if (item == 'Snack') {
                    _snackQuantity = quantity;
                  } else if (item == 'Biscuit') {
                    _biscuitQuantity = quantity;
                  } else if (item == 'Coffee') {
                    _coffeeQuantity = quantity;
                  } else if (item == 'Tea') {
                    _teaQuantity = quantity;
                  }
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
