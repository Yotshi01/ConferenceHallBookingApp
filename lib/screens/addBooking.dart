import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:intl/intl.dart';

class AddBooking extends StatefulWidget {
  final DateTime selectedStartTime;
  final DateTime selectedEndTime;
  final String selectedLocation;
  final String selectedConferenceHall;
  const AddBooking(
      {Key? key,
      required this.selectedStartTime,
      required this.selectedEndTime,
      required this.selectedLocation,
      required this.selectedConferenceHall})
      : super(key: key);

  @override
  State<AddBooking> createState() => _AddBookingState();
}

class MultiSelectDepartments extends StatefulWidget {
  final List<String> departments;
  const MultiSelectDepartments({Key? key, required this.departments})
      : super(key: key);

  @override
  State<MultiSelectDepartments> createState() => _MultiSelectDepartmentsState();
}

class _MultiSelectDepartmentsState extends State<MultiSelectDepartments> {
  // this variable holds the selected departments
  final List<String> _selectedDepartments = [];

  // This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedDepartments.add(itemValue);
      } else {
        _selectedDepartments.remove(itemValue);
      }
    });
  }

  // This function is called when the cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

  // this function is called when the submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedDepartments);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Departments'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.departments
            .map((department) => CheckboxListTile(
                  value: _selectedDepartments.contains(department),
                  title: Text(department),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(department, isChecked!),
                ))
            .toList(),
      )),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        )
      ],
    );
  }
}

class _AddBookingState extends State<AddBooking> {
  TextEditingController _meetingTitleController = TextEditingController();
  TextEditingController _meetingDescriptionController = TextEditingController();
  TextEditingController _otherDetailsController = TextEditingController();
  TextEditingController _meetingReportedByController = TextEditingController();

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

  List<String> _selectedDepartments = [];

  void _showMultiSelectDepartments() async {
    List<String> departments = getDepartmentNames();

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelectDepartments(departments: departments);
        });

    if (results != null) {
      setState(() {
        _selectedDepartments = results;
      });
    }
  }

  void _showDiscardBookingDetailConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Discard'),
          content: Text(
              'Are you sure you want to discard currently filled booking details?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog first
                await Future.delayed(
                    Duration(milliseconds: 300)); // Add a delay if needed
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Navigate after the dialog is closed
                // try {
                //   Navigator.of(dialogContext).popUntil((route) => route.isFirst);
                // } catch (e) {
                //   print('Error: $e');
                // }
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showAddNewBookingConfirmationDialog(BuildContext dialogContext) {
    showDialog(
      context: dialogContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Booking'),
          content: Text('Are you sure you want to add this booking?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  // toBeUpdatedBookingData.bookingId =
                  //     widget.currentBookingData
                  //         .bookingId;
                  toBeAddedBookingData.bookingMeetingTitle =
                      _meetingTitleController.text;
                  toBeAddedBookingData.bookingMeetingDescription =
                      _meetingDescriptionController.text;
                  toBeAddedBookingData.bookingOtherDetails =
                      _otherDetailsController.text;
                  toBeAddedBookingData.bookingCreatedAt =
                      DateTime.now().toString();
                  toBeAddedBookingData.bookingStatus = 1;
                  toBeAddedBookingData.userId = currentUserData!.id;
                  toBeAddedBookingData.bookingDate =
                      widget.selectedStartTime.toString();
                  toBeAddedBookingData.bookingStartTime =
                      '${widget.selectedStartTime.hour.toString().padLeft(2, '0')}:${widget.selectedStartTime.minute.toString().padLeft(2, '0')}';
                  toBeAddedBookingData.bookingEndTime =
                      '${widget.selectedEndTime.hour.toString().padLeft(2, '0')}:${widget.selectedEndTime.minute.toString().padLeft(2, '0')}';
                  toBeAddedBookingData.bookingReportedBy =
                      _meetingReportedByController.text;

                  print(
                      "${toBeAddedBookingData.bookingMeetingTitle} || ${toBeAddedBookingData.bookingMeetingDescription} || ${toBeAddedBookingData.bookingOtherDetails} || ${toBeAddedBookingData.bookingCreatedAt} || ${toBeAddedBookingData.bookingStatus} || ${toBeAddedBookingData.userId} || ${toBeAddedBookingData.bookingDate} || ${toBeAddedBookingData.bookingStartTime} || ${toBeAddedBookingData.bookingEndTime} || ${toBeAddedBookingData.bookingReportedBy}");
                });

                var response = await addBooking(toBeAddedBookingData);

                var bookingDepartmentsResponse = await addBookingDepartments(
                    _selectedDepartments, response.data!.bookingId!);

                // var bookingDepartmentsResponse =
                //     await addBookingDepartments(
                //         _selectedDepartments, 15);

                if (response.status == 'success' &&
                    bookingDepartmentsResponse.status == 'success') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                          "Booking and booking departments added successfully!"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          "Failed to add booking and/or booking departments"),
                    ),
                  );
                }
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => HomeScreen()));
                // Update the selected tab to navigate to another tab

                Navigator.of(context).pop(); // Close the dialog
                await Future.delayed(
                    Duration(milliseconds: 300)); // Add a delay if needed
                Navigator.of(dialogContext).popUntil((route) =>
                    route.isFirst); // Navigate after the dialog is closed
                // Navigator.of(dialogContext).pushReplacement(MaterialPageRoute(
                //   builder: (context) => const SyncfusionCalendar(),
                // ));
                await Future.delayed(
                    Duration(milliseconds: 300)); // Add a delay if needed
                dialogContext
                    .read<BottomNavBarCubit>()
                    .updateSelectedItem(BottomNavBarItem.home);
                // Navigator.of(dialogContext).pushReplacement(MaterialPageRoute(
                //   builder: (context) => const HomeScreen(),
                // ));

                // dialogContext.read<BottomNavBarCubit>().refreshTabs();
                // Navigator.of(dialogContext).pop(); // Close the dialog first
                // await Future.delayed(
                //     Duration(milliseconds: 300)); // Add a delay if needed
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('${selectedLocation} sddddscddcdscsdcdscs');
    final conferenceHallImageName = getConferenceHallImageName(
        getConferenceHallId(widget.selectedConferenceHall));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15),
            // width: 352,
            // height: 641,
            decoration: const BoxDecoration(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/conference_hall_images/${conferenceHallImageName}",
                              width: screenWidth * 0.24,
                              height: screenHeight * 0.15,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Text('Start Time: ${widget.selectedStartTime}'),
                    // Text('End Time: ${widget.selectedEndTime}'),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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
                    Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    // SizedBox(
                    //   width: 300,
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       final date = await _selectedDate(context);
                    //       if (date == null) return;
                    //       setState(() {
                    //         dateTime = date;
                    //         selectedDate = date;
                    //         toBeAddedBookingData.bookingDate =
                    //             selectedDate.toString();
                    //       });
                    //       print('${date} date date date date date');
                    //       print(
                    //           '${selectedDate.toString()} date date date date date');
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       minimumSize: Size(
                    //           300, 50), // Adjust the width and height as needed
                    //       primary: Colors.grey[
                    //           200], // Set the background color to light gray
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(
                    //             10.0), // Adjust the value as needed
                    //       ),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons
                    //               .calendar_month, // Replace with the icon you want
                    //           color: Color(
                    //               0xFF696767), // Set the color of the icon
                    //           size: 24, // Set the size of the icon
                    //         ),
                    //         SizedBox(
                    //             width:
                    //                 8), // Add some spacing between the icon and text
                    //         Text(
                    //           selectedDate != null
                    //               ? '${dateTime.year}-${dateTime.month}-${dateTime.day}'
                    //               :
                    //               // controller: _meetingTitleController,
                    //               'Select Date',
                    //           style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 14,
                    //             fontFamily: 'Noto Sans',
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        decoration: BoxDecoration(
                          color: Colors.grey[
                              200], // Set the background color to light gray
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value as needed
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                              ),
                              child: Icon(
                                Icons
                                    .calendar_month, // Replace with the icon you want
                                color: Color(
                                    0xFF696767), // Set the color of the icon
                                size: 24, // Set the size of the icon
                              ),
                            ),
                            SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text
                            Text(
                              '${widget.selectedStartTime.day}-${widget.selectedStartTime.month}-${widget.selectedStartTime.year}',
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
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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

                        // SizedBox(
                        //   width: 140,
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       // Handle button tap here
                        //       print('Button tapped');
                        //       final time = await _selectedTime(context);
                        //       if (time == null) return;
                        //       print(selectedStartTime);
                        //       setState(() {
                        //         printedStartTime = time;
                        //         selectedStartTime = time;
                        //         toBeAddedBookingData.strTime =
                        //             '${selectedStartTime!.hour.toString().padLeft(2, '0')}:${selectedStartTime!.minute.toString().padLeft(2, '0')}';
                        //       });
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       minimumSize: Size(100,
                        //           50), // Adjust the width and height as needed
                        //       primary: Colors.grey[
                        //           200], // Set the background color to light gray
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             10.0), // Adjust the value as needed
                        //       ),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Icon(
                        //           Icons
                        //               .av_timer, // Replace with the icon you want
                        //           color: Color(
                        //               0xFF696767), // Set the color of the icon
                        //           size: 24, // Set the size of the icon
                        //         ),
                        //         SizedBox(
                        //             width:
                        //                 8), // Add some spacing between the icon and text
                        //         Text(
                        //           // controller: _meetingTitleController,
                        //           selectedStartTime != null
                        //               ? '${printedStartTime.hour.toString().padLeft(2, '0')}:${printedStartTime.minute.toString().padLeft(2, '0')}'
                        //               : 'Start Time',
                        //           style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontFamily: 'Noto Sans',
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                            width: 130,
                            child: Container(
                              width: 140,
                              child: Card(
                                color: Colors.grey[
                                    200], // Set the background color to light gray
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the value as needed
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        //   '${widget.selectedStartTime.hour.toString().padLeft(2, '0')}:${widget.selectedStartTime.minute.toString().padLeft(2, '0')}',
                                        '${convertDateTimeTimeIntoDesiredFormat(widget.selectedStartTime)}',
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
                            )),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
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

                        // SizedBox(
                        //   width: 140,
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       // Handle button tap here
                        //       print('Button tapped');
                        //       final time = await _selectedTime(context);
                        //       if (time == null) return;
                        //       print(selectedEndTime);
                        //       setState(() {
                        //         printedEndTime = time;
                        //         selectedEndTime = time;
                        //         toBeAddedBookingData.endTime =
                        //             '${selectedEndTime!.hour.toString().padLeft(2, '0')}:${selectedEndTime!.minute.toString().padLeft(2, '0')}';
                        //       });
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       minimumSize: Size(100,
                        //           50), // Adjust the width and height as needed
                        //       primary: Colors.grey[
                        //           200], // Set the background color to light gray
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             10.0), // Adjust the value as needed
                        //       ),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Icon(
                        //           Icons
                        //               .av_timer, // Replace with the icon you want
                        //           color: Color(
                        //               0xFF696767), // Set the color of the icon
                        //           size: 24, // Set the size of the icon
                        //         ),
                        //         SizedBox(
                        //             width:
                        //                 8), // Add some spacing between the icon and text
                        //         Text(
                        //           // controller: _meetingTitleController,
                        //           selectedEndTime != null
                        //               ? '${printedEndTime.hour.toString().padLeft(2, '0')}:${printedEndTime.minute.toString().padLeft(2, '0')}'
                        //               : 'End Time',
                        //           style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 14,
                        //             fontFamily: 'Noto Sans',
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                            width: 130,
                            child: Container(
                              width: 140,
                              child: Card(
                                color: Colors.grey[
                                    200], // Set the background color to light gray
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the value as needed
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        // '${widget.selectedEndTime.hour.toString().padLeft(2, '0')}:${widget.selectedEndTime.minute.toString().padLeft(2, '0')}',
                                        '${convertDateTimeTimeIntoDesiredFormat(widget.selectedEndTime)}',
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
                            )),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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
                    Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
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
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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

                    // LocationsDropdown(callBackFunction: callBack),

                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 1), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Use a light gray color
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value as needed
                        ),
                        child: Text(
                          '${widget.selectedLocation}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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
                    // ConferenceHallDropdown(),

                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
                        alignment: Alignment.center,
                        // width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors
                                  .transparent), // Set border color to transparent
                        ),
                        child: Text(
                          '${widget.selectedConferenceHall}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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
                    Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
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

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
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

                    Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),

                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
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

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Meeting Reported By',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    SizedBox(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: 50,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 1), // Adjust the padding as needed
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Use a light gray color
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the value as needed
                        ),
                        child: TextField(
                          controller: _meetingReportedByController,
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

                    Container(
                      width: screenWidth * 0.5, // Set the desired width
                      child: ElevatedButton(
                        onPressed: _showMultiSelectDepartments,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[100],
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.all(10),
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Select Department'),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Select Departments',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontFamily: 'Noto Sans',
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),

                    // const Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1,
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                    Wrap(
                      children: _selectedDepartments
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),

                    // ElevatedButton(
                    //   onPressed: _showMultiSelectDepartments,
                    //   style: ElevatedButton.styleFrom(
                    //     shape:
                    //         CircleBorder(), // Use CircleBorder to make the button circular
                    //     backgroundColor: Colors.grey[
                    //         200], // Change the button color to your preference
                    //     padding: EdgeInsets.all(
                    //         11.0), // Adjust the padding as needed
                    //   ),
                    //   child: Icon(
                    //     Icons.add, // You can use your preferred edit icon here
                    //     color: Colors
                    //         .black, // Change the icon color to your preference
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap: _showMultiSelectDepartments,
                    //   child: Container(
                    //     width: 40, // Set the desired width
                    //     height: 40, // Set the desired height
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape
                    //           .circle, // Use BoxShape.circle to make the container circular
                    //       color: Colors.amber[
                    //           100], // Change the container color to your preference
                    //     ),
                    //     child: Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(
                    //             8.0), // Adjust the padding as needed
                    //         child: Icon(
                    //           Icons
                    //               .add, // You can use your preferred edit icon here
                    //           color: Colors
                    //               .black, // Change the icon color to your preference
                    //           size: 24, // Set the desired size of the icon
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

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
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             SyncfusionCalendar()));
                              // Pop until the base page is reached
                              _showDiscardBookingDetailConfirmationDialog(
                                  context);

// Update the selected tab to navigate to another tab
                              // context
                              //     .read<BottomNavBarCubit>()
                              //     .updateSelectedItem(BottomNavBarItem.home);
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
                          onPressed: () {
                            _showAddNewBookingConfirmationDialog(context);
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
      ),
    );
  }
}
