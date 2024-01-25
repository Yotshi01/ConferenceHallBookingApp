import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
// import 'package:intl/intl.dart';

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

class _AddBookingState extends State<AddBooking> {
  final TextEditingController _meetingTitleController = TextEditingController();
  final TextEditingController _meetingDescriptionController =
      TextEditingController();
  final TextEditingController _otherDetailsController = TextEditingController();
  final TextEditingController _meetingReportedByController =
      TextEditingController();

  DateTime? selectedDate;
  DateTime dateTime = DateTime(2022, 12, 24);
  TimeOfDay? selectedStartTime;
  TimeOfDay printedStartTime = const TimeOfDay(hour: 4, minute: 24);
  TimeOfDay? selectedEndTime;
  TimeOfDay printedEndTime = const TimeOfDay(hour: 4, minute: 24);

  bool isMeetingTitleValid = false,
      isBookingRequestedByValid = false,
      isMeetingDescriptionValid = false,
      isBookingRequirementDetailsByValid = true,
      showLoadingInPlaceOfSubmitButton = false;

  final HomeScreenState? homeScreenState = homeScreenKey.currentState;
  final TabbarSetupState? tabbarSetupState = tabbarSetupKey.currentState;

  // int selectedAttendees = 1;

  // final SyncfusionCalendarState? syncfusionCalendarState =
  //     syncfusionCalendarKey.currentState;

  // Widget attendeeItems(BuildContext context) {
  //   List<DropdownMenuItem<int>> getAttendeeItems() {
  //     List<DropdownMenuItem<int>> items = [];
  //     for (int i = 1; i <= 250; i++) {
  //       items.add(DropdownMenuItem(
  //         value: i,
  //         child: Text('$i'),
  //       ));
  //     }
  //     return items;
  //   }

  //   return DropdownButton<int>(
  //     value: selectedAttendees,
  //     onChanged: (int? value) {
  //       setState(() {
  //         selectedAttendees = value!;
  //       });
  //     },
  //     items: getAttendeeItems(),
  //   );
  // }

  int? selectedAttendees; // Use int? to allow null

  final SyncfusionCalendarState? syncfusionCalendarState =
      syncfusionCalendarKey.currentState;

  Widget attendeeItems(BuildContext context) {
    List<DropdownMenuItem<int?>> getAttendeeItems() {
      List<DropdownMenuItem<int?>> items = [];
      items.add(const DropdownMenuItem(
        value: null, // Set the initial value to null
        child: Text('Select'),
      ));
      for (int i = 1; i <= 120; i++) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text('$i'),
        ));
      }
      return items;
    }

    return DropdownButton<int?>(
      value: selectedAttendees,
      onChanged: (int? value) {
        setState(() {
          selectedAttendees = value;
        });
      },
      items: getAttendeeItems(),
    );
  }

  String? selectedLocation;
  callBack(varSelectedLocation) {
    setState(() {
      selectedLocation = varSelectedLocation;
    });
  }

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

  // Future<TimeOfDay?> _selectedTime(BuildContext context) {
  //   final now = DateTime.now();
  //   return showTimePicker(
  //       initialEntryMode: TimePickerEntryMode.inputOnly,
  //       context: context,
  //       initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  // }

  // Future<DateTime?> _selectedDate(BuildContext context) => showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now().add(Duration(seconds: 1)),
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime(2100),
  //     );

  late List<String> _selectedDepartments;

  void _showMultiSelectDepartments() async {
    List<String> departments =
        getDepartmentNames(getLocationId(widget.selectedLocation));

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelectDepartments(
            departments: departments,
            initialSelectedDepartments: _selectedDepartments,
          );
        });

    if (results != null) {
      setState(() {
        _selectedDepartments = results;
      });
    }
  }

  late List<String> _selectedRefreshments;

  void _showMultiSelectRefreshments() async {
    List<String> refreshments = getRefreshmentNames();

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelectRefreshments(
            refreshments: refreshments,
            initialSelectedRefreshments: _selectedRefreshments,
          );
        });

    if (results != null) {
      setState(() {
        _selectedRefreshments = results;
      });
    }
  }

  late List<String> _selectedStationaries;

  void _showMultiSelectStationaries() async {
    List<String> stationaries = getStationaryNames();

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelectStationaries(
            stationaries: stationaries,
            initialSelectedStationaries: _selectedStationaries,
          );
        });

    if (results != null) {
      setState(() {
        _selectedStationaries = results;
      });
    }
  }

  late List<String> _selectedAssets;

  void _showMultiSelectAssets() async {
    List<String> assets = getAssetNames();

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelectAssetRequirements(
            assets: assets,
            initialSelectedAssets: _selectedAssets,
          );
        });

    if (results != null) {
      setState(() {
        _selectedAssets = results;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDepartments = [];
    _selectedRefreshments = [];
    _selectedStationaries = [];
    _selectedAssets = [];

    if (tabbarSetupState != null) {
      tabbarSetupState!.appBarTitle = 'Add Booking Details';
    }
  }

  void _showDiscardBookingDetailConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Discard'),
          content: const Text(
              'Are you sure you want to discard currently filled booking details?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog first
                await Future.delayed(
                    const Duration(milliseconds: 300)); // Add a delay if needed
                // Navigator.of(context)
                //     .pop(); // Navigate after the dialog is closed
                navigatorKeys[BottomNavBarItem.booking]!.currentState!.pop();
                // try {
                //   Navigator.of(dialogContext).popUntil((route) => route.isFirst);
                // } catch (e) {
                //   print('Error: $e');
                // }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showAddNewBookingConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Add Booking'),
          content: const Text('Are you sure you want to add this booking?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog
                setState(() {
                  // toBeUpdatedBookingData.bookingId =
                  //     widget.currentBookingData
                  //         .bookingId;
                  toBeAddedBookingData.bookingMeetingTitle =
                      _meetingTitleController.text;
                  toBeAddedBookingData.bookingMeetingDescription =
                      _meetingDescriptionController.text;
                  toBeAddedBookingData.bookingRequirementDetails =
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
                  toBeAddedBookingData.bookingNumberOfAttendees =
                      selectedAttendees;
                  showLoadingInPlaceOfSubmitButton = true;
                  // print(
                  //     "${toBeAddedBookingData.bookingMeetingTitle} || ${toBeAddedBookingData.bookingMeetingDescription} || ${toBeAddedBookingData.bookingRequirementDetails} || ${toBeAddedBookingData.bookingCreatedAt} || ${toBeAddedBookingData.bookingStatus} || ${toBeAddedBookingData.userId} || ${toBeAddedBookingData.bookingDate} || ${toBeAddedBookingData.bookingStartTime} || ${toBeAddedBookingData.bookingEndTime} || ${toBeAddedBookingData.bookingReportedBy}");
                });

                if (isMeetingTitleValid &&
                    isBookingRequestedByValid &&
                    isMeetingDescriptionValid &&
                    isBookingRequirementDetailsByValid &&
                    selectedAttendees != null) {
                  var response = await addBooking(toBeAddedBookingData);

                  if (_selectedDepartments.isNotEmpty) {
                    var bookingDepartmentsResponse =
                        await addBookingDepartments(
                            _selectedDepartments, response.data!.bookingId!);
                  }

                  if (_selectedRefreshments.isNotEmpty) {
                    var bookingRefreshmentsResponse =
                        await addBookingRefreshments(
                            _selectedRefreshments, response.data!.bookingId!);
                  }

                  if (_selectedStationaries.isNotEmpty) {
                    var bookingStationariesResponse =
                        await addBookingStationaries(
                            _selectedStationaries, response.data!.bookingId!);
                  }

                  if (_selectedAssets.isNotEmpty) {
                    var bookingAssetRequirementsResponse =
                        await addBookingAssetRequirement(
                            _selectedAssets, response.data!.bookingId!);
                  }

                  // var bookingDepartmentsResponse =
                  //     await addBookingDepartments(
                  //         _selectedDepartments, 15);

                  // if (response.status == 'success' &&
                  //     bookingDepartmentsResponse.status == 'success' &&
                  //     bookingRefreshmentsResponse.status == 'success' &&
                  //     bookingAssetRequirementsResponse.status == 'success') {
                  if (response.status == 'success') {
                    // setState(() {
                    //   isRefreshNeeded = true;
                    // });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Booking added successfully!"),
                      ),
                    );

                    if (homeScreenState != null) {
                      homeScreenState!.loadData();
                    }

                    if (syncfusionCalendarState != null) {
                      syncfusionCalendarState!.refreshScreen();
                    }

                    // await Future.delayed(
                    //     Duration(milliseconds: 300)); // Add a delay if needed

                    navigatorKeys[BottomNavBarItem.home]!
                        .currentState!
                        .popUntil((route) => route.isFirst);

                    // Navigator.of(context).popUntil((route) => route.isFirst);
                    // await Future.delayed(
                    //     Duration(milliseconds: 300)); // Add a delay if needed

                    context
                        .read<BottomNavBarCubit>()
                        .updateSelectedItem(BottomNavBarItem.home);

                    navigatorKeys[BottomNavBarItem.booking]!
                        .currentState!
                        .popUntil((route) => route.isFirst);

                    setState(() {
                      showLoadingInPlaceOfSubmitButton = false;
                    });
                  } else {
                    setState(() {
                      showLoadingInPlaceOfSubmitButton = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            "Failed to add booking and/or booking departments"),
                      ),
                    );
                  }
                } else {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     backgroundColor: Colors.red,
                  //     content: Text(
                  //         "Please fill valid data in all the required fields"),
                  //   ),
                  // );
                  Fluttertoast.showToast(
                      msg: 'Please fill valid data in all the required fields',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      // timeInSecForIos: 1,
                      backgroundColor: Colors.amber[100],
                      textColor: Colors.black);

                  setState(() {
                    showLoadingInPlaceOfSubmitButton = false;
                  });
                }
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => HomeScreen()));
                // Update the selected tab to navigate to another tab
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('${selectedLocation} sddddscddcdscsdcdscs');
    final conferenceHallImageName = getConferenceHallImageName(
        getConferenceHallId(widget.selectedConferenceHall));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          //horizontal: screenWidth * 0.05,
                          ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                          navigatorKeys[BottomNavBarItem.booking]!
                              .currentState!
                              .pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape:
                              const CircleBorder(), // Use CircleBorder to make the button circular
                          backgroundColor: Colors.grey[
                              300], // Change the button color to your preference
                          padding: const EdgeInsets.all(
                              0.0), // Adjust the padding as needed
                        ),
                        child: const Icon(
                          Icons
                              .arrow_back, // You can use your preferred edit icon here
                          color: Colors
                              .black, // Change the icon color to your preference
                        ),
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    "$liveBaseUrl/uploads/conferences/${conferenceHallImageName}",
                    width: screenWidth * 0.27,
                    height: screenHeight * 0.09,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                      ),
                      child: const Column(
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Image.asset(
                          //     "assets/images/conference_hall_images/${conferenceHallImageName}",
                          //     width: screenWidth * 0.24,
                          //     height: screenHeight * 0.15,
                          //   ),
                          // )

                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Image.network(
                          //     liveBaseUrl +
                          //         "/uploads/conferences/" +
                          //         conferenceHallImageName,
                          //     width: screenWidth * 0.24,
                          //     height: screenHeight * 0.15,
                          //     loadingBuilder: (BuildContext context,
                          //         Widget child,
                          //         ImageChunkEvent? loadingProgress) {
                          //       if (loadingProgress == null) {
                          //         return child;
                          //       } else {
                          //         return Center(
                          //           child: CircularProgressIndicator(
                          //             value:
                          //                 loadingProgress.expectedTotalBytes !=
                          //                         null
                          //                     ? loadingProgress
                          //                             .cumulativeBytesLoaded /
                          //                         (loadingProgress
                          //                                 .expectedTotalBytes ??
                          //                             1)
                          //                     : null,
                          //           ),
                          //         );
                          //       }
                          //     },
                          //     errorBuilder: (BuildContext context, Object error,
                          //         StackTrace? stackTrace) {
                          //       return Text('Error loading image');
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // Text('Start Time: ${widget.selectedStartTime}'),
                    // Text('End Time: ${widget.selectedEndTime}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(Icons.date_range_outlined),
                              // Text(
                              //   'Date',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 14,
                              //     fontFamily: 'Noto Sans',
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ),
                            // SizedBox(
                            //     width: 30,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: Text(
                            //         '-',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 14,
                            //           fontFamily: 'Noto Sans',
                            //         ),
                            //       ),
                            //     )),
                            Text(
                              '${widget.selectedStartTime.day}-${widget.selectedStartTime.month}-${widget.selectedStartTime.year}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                              ),
                            ),
                          ],
                        ),
                        // Divider(
                        //   color: Color(
                        //       0xFFC2C0C0), // Set the color of the divider line
                        //   thickness: 1, // Set the thickness of the divider line
                        // ),
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

                        // SizedBox(
                        //   child: Container(
                        //     width: screenWidth * 0.9, // Adjust the width as needed
                        //     height: 50, // Adjust the height as needed
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey[
                        //           200], // Set the background color to light gray
                        //       borderRadius: BorderRadius.circular(
                        //           10.0), // Adjust the value as needed
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsets.only(
                        //             left: 15,
                        //           ),
                        //           child: Icon(
                        //             Icons
                        //                 .calendar_month, // Replace with the icon you want
                        //             color: Color(
                        //                 0xFF696767), // Set the color of the icon
                        //             size: 24, // Set the size of the icon
                        //           ),
                        //         ),
                        //         SizedBox(
                        //             width:
                        //                 8), // Add some spacing between the icon and text
                        //         Text(
                        //           '${widget.selectedStartTime.day}-${widget.selectedStartTime.month}-${widget.selectedStartTime.year}',
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

                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 15.0),
                        //   child: Text(
                        //     'Timing',
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //       fontFamily: 'Noto Sans',
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //   ),
                        // ),

                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(Icons.access_time),
                              // Text(
                              //   'Time',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 14,
                              //     fontFamily: 'Noto Sans',
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ),
                            // SizedBox(
                            //     width: 30,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: Text(
                            //         '-',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 14,
                            //           fontFamily: 'Noto Sans',
                            //         ),
                            //       ),
                            //     )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  //   '${widget.selectedStartTime.hour.toString().padLeft(2, '0')}:${widget.selectedStartTime.minute.toString().padLeft(2, '0')}',
                                  '${convertDateTimeTimeIntoDesiredFormat(widget.selectedStartTime)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Noto Sans',
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
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
                                Text(
                                  // '${widget.selectedEndTime.hour.toString().padLeft(2, '0')}:${widget.selectedEndTime.minute.toString().padLeft(2, '0')}',
                                  '${convertDateTimeTimeIntoDesiredFormat(widget.selectedEndTime)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Noto Sans',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Divider(
                        //   color: Color(
                        //       0xFFC2C0C0), // Set the color of the divider line
                        //   thickness: 1, // Set the thickness of the divider line
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     // Icon(
                        //     //   Icons
                        //     //       .av_timer, // Replace with the icon you want
                        //     //   color: Color(
                        //     //       0xFF696767), // Set the color of the icon
                        //     //   size: 24, // Set the size of the icon
                        //     // ),
                        //     // SizedBox(
                        //     //     width:
                        //     //         8), // Add some spacing between the icon and text

                        //     // SizedBox(
                        //     //   width: 140,
                        //     //   child: ElevatedButton(
                        //     //     onPressed: () async {
                        //     //       // Handle button tap here
                        //     //       print('Button tapped');
                        //     //       final time = await _selectedTime(context);
                        //     //       if (time == null) return;
                        //     //       print(selectedStartTime);
                        //     //       setState(() {
                        //     //         printedStartTime = time;
                        //     //         selectedStartTime = time;
                        //     //         toBeAddedBookingData.strTime =
                        //     //             '${selectedStartTime!.hour.toString().padLeft(2, '0')}:${selectedStartTime!.minute.toString().padLeft(2, '0')}';
                        //     //       });
                        //     //     },
                        //     //     style: ElevatedButton.styleFrom(
                        //     //       minimumSize: Size(100,
                        //     //           50), // Adjust the width and height as needed
                        //     //       primary: Colors.grey[
                        //     //           200], // Set the background color to light gray
                        //     //       shape: RoundedRectangleBorder(
                        //     //         borderRadius: BorderRadius.circular(
                        //     //             10.0), // Adjust the value as needed
                        //     //       ),
                        //     //     ),
                        //     //     child: Row(
                        //     //       children: [
                        //     //         Icon(
                        //     //           Icons
                        //     //               .av_timer, // Replace with the icon you want
                        //     //           color: Color(
                        //     //               0xFF696767), // Set the color of the icon
                        //     //           size: 24, // Set the size of the icon
                        //     //         ),
                        //     //         SizedBox(
                        //     //             width:
                        //     //                 8), // Add some spacing between the icon and text
                        //     //         Text(
                        //     //           // controller: _meetingTitleController,
                        //     //           selectedStartTime != null
                        //     //               ? '${printedStartTime.hour.toString().padLeft(2, '0')}:${printedStartTime.minute.toString().padLeft(2, '0')}'
                        //     //               : 'Start Time',
                        //     //           style: TextStyle(
                        //     //             color: Colors.black,
                        //     //             fontSize: 14,
                        //     //             fontFamily: 'Noto Sans',
                        //     //           ),
                        //     //         ),
                        //     //       ],
                        //     //     ),
                        //     //   ),
                        //     // ),

                        //     SizedBox(
                        //         width: 130,
                        //         child: Container(
                        //           width: 140,
                        //           child: Card(
                        //             color: Colors.grey[
                        //                 200], // Set the background color to light gray
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(
                        //                   10.0), // Adjust the value as needed
                        //             ),
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children: [
                        //                   Icon(
                        //                     Icons
                        //                         .av_timer, // Replace with the icon you want
                        //                     color: Color(
                        //                         0xFF696767), // Set the color of the icon
                        //                     size: 24, // Set the size of the icon
                        //                   ),
                        //                   SizedBox(
                        //                       width:
                        //                           8), // Add some spacing between the icon and text

                        //                   Text(
                        //                     //   '${widget.selectedStartTime.hour.toString().padLeft(2, '0')}:${widget.selectedStartTime.minute.toString().padLeft(2, '0')}',
                        //                     '${convertDateTimeTimeIntoDesiredFormat(widget.selectedStartTime)}',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 14,
                        //                       fontFamily: 'Noto Sans',
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         )),

                        //     Padding(
                        //       padding: EdgeInsets.symmetric(
                        //         horizontal: 15,
                        //       ),
                        //       child: Text(
                        //         'to ',
                        //         style: TextStyle(
                        //           color: Color(0xFF696767),
                        //           fontSize: 12,
                        //           fontFamily: 'Noto Sans',
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),

                        //     // SizedBox(
                        //     //   width: 140,
                        //     //   child: ElevatedButton(
                        //     //     onPressed: () async {
                        //     //       // Handle button tap here
                        //     //       print('Button tapped');
                        //     //       final time = await _selectedTime(context);
                        //     //       if (time == null) return;
                        //     //       print(selectedEndTime);
                        //     //       setState(() {
                        //     //         printedEndTime = time;
                        //     //         selectedEndTime = time;
                        //     //         toBeAddedBookingData.endTime =
                        //     //             '${selectedEndTime!.hour.toString().padLeft(2, '0')}:${selectedEndTime!.minute.toString().padLeft(2, '0')}';
                        //     //       });
                        //     //     },
                        //     //     style: ElevatedButton.styleFrom(
                        //     //       minimumSize: Size(100,
                        //     //           50), // Adjust the width and height as needed
                        //     //       primary: Colors.grey[
                        //     //           200], // Set the background color to light gray
                        //     //       shape: RoundedRectangleBorder(
                        //     //         borderRadius: BorderRadius.circular(
                        //     //             10.0), // Adjust the value as needed
                        //     //       ),
                        //     //     ),
                        //     //     child: Row(
                        //     //       children: [
                        //     //         Icon(
                        //     //           Icons
                        //     //               .av_timer, // Replace with the icon you want
                        //     //           color: Color(
                        //     //               0xFF696767), // Set the color of the icon
                        //     //           size: 24, // Set the size of the icon
                        //     //         ),
                        //     //         SizedBox(
                        //     //             width:
                        //     //                 8), // Add some spacing between the icon and text
                        //     //         Text(
                        //     //           // controller: _meetingTitleController,
                        //     //           selectedEndTime != null
                        //     //               ? '${printedEndTime.hour.toString().padLeft(2, '0')}:${printedEndTime.minute.toString().padLeft(2, '0')}'
                        //     //               : 'End Time',
                        //     //           style: TextStyle(
                        //     //             color: Colors.black,
                        //     //             fontSize: 14,
                        //     //             fontFamily: 'Noto Sans',
                        //     //           ),
                        //     //         ),
                        //     //       ],
                        //     //     ),
                        //     //   ),
                        //     // ),

                        //     SizedBox(
                        //         width: 130,
                        //         child: Container(
                        //           width: 140,
                        //           child: Card(
                        //             color: Colors.grey[
                        //                 200], // Set the background color to light gray
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(
                        //                   10.0), // Adjust the value as needed
                        //             ),
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children: [
                        //                   Icon(
                        //                     Icons
                        //                         .av_timer, // Replace with the icon you want
                        //                     color: Color(
                        //                         0xFF696767), // Set the color of the icon
                        //                     size: 24, // Set the size of the icon
                        //                   ),
                        //                   SizedBox(
                        //                       width:
                        //                           8), // Add some spacing between the icon and text
                        //                   Text(
                        //                     // '${widget.selectedEndTime.hour.toString().padLeft(2, '0')}:${widget.selectedEndTime.minute.toString().padLeft(2, '0')}',
                        //                     '${convertDateTimeTimeIntoDesiredFormat(widget.selectedEndTime)}',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 14,
                        //                       fontFamily: 'Noto Sans',
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         )),
                        //   ],
                        // ),

                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(Icons.location_on_outlined),
                              // child: Text(
                              //   'Location',
                              //   style: TextStyle(
                              //     color: Colors.black,
                              //     fontSize: 14,
                              //     fontFamily: 'Noto Sans',
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ),
                            // SizedBox(
                            //     width: 30,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: Text(
                            //         '-',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 14,
                            //           fontFamily: 'Noto Sans',
                            //         ),
                            //       ),
                            //     )),
                            Expanded(
                              child: Text(
                                '${widget.selectedLocation} , ${widget.selectedConferenceHall}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ),

                            // Expanded(
                            //   child: Text(
                            //     '${widget.selectedConferenceHall}',
                            //     style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 14,
                            //       fontFamily: 'Noto Sans',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),

                        // SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: 15.0),
                    //       child: Text(
                    //         'Conference Room Name',
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 14,
                    //           fontFamily: 'Noto Sans',
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //         width: 30,
                    //         child: Align(
                    //           alignment: Alignment.center,
                    //           child: Text(
                    //             '-',
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 14,
                    //               fontFamily: 'Noto Sans',
                    //             ),
                    //           ),
                    //         )),
                    //     Expanded(
                    //       child: Text(
                    //         '${widget.selectedConferenceHall}',
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 14,
                    //           fontFamily: 'Noto Sans',
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        Text(
                          'Meeting Title',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Meeting Title',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontFamily: 'Noto Sans',
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    TextField(
                      controller: _meetingTitleController,
                      // style: const TextStyle(
                      //   color: Colors.black,
                      //   fontSize: 14,
                      //   fontFamily: 'Noto Sans',
                      // ),
                      onChanged: (text) {
                        // Your validation logic here
                        if (text.isNotEmpty && text.length <= 150) {
                          setState(() {
                            isMeetingTitleValid = true;
                          });
                        } else {
                          setState(() {
                            isMeetingTitleValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true, // Set to true to enable background color
                        fillColor: Colors.grey[200],
                        hintText: "Enter your meeting title here",
                        labelText: !isMeetingTitleValid
                            ? 'Not more than 150 letters'
                            : null,
                        border: OutlineInputBorder(
                          // Adjust these values to position the label inside the border
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Adjust these values for focused state
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // border: InputBorder
                        //     .none, // Remove the default TextField border
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Location',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontFamily: 'Noto Sans',
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1, // Set the thickness of the divider line
                    // ),
                    // // Row(
                    // //   children: [
                    // //     Icon(
                    // //       Icons
                    // //           .pin_drop_outlined, // Replace with the icon you want
                    // //       color: Colors
                    // //           .yellow, // Set the color of the icon
                    // //       size: 24, // Set the size of the icon
                    // //     ),
                    // //     // SizedBox(
                    // //     //     width:
                    // //     //         8), // Add some spacing between the icon and text

                    // //   ],
                    // // ),

                    // // LocationsDropdown(callBackFunction: callBack),

                    // SizedBox(
                    //   child: Container(
                    //     width: screenWidth * 0.9,
                    //     height: 50,
                    //     alignment: Alignment.center,
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 15.0,
                    //         vertical: 1), // Adjust the padding as needed
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey[200], // Use a light gray color
                    //       borderRadius: BorderRadius.circular(
                    //           10.0), // Adjust the value as needed
                    //     ),
                    //     child: Text(
                    //       '${widget.selectedLocation}',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: 'Noto Sans',
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Conference Room Name',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontFamily: 'Noto Sans',
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    // Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1, // Set the thickness of the divider line
                    // ),
                    // // Text(
                    // //   widget.currentConferenceRoomName,
                    // //   style: TextStyle(
                    // //     color: Color(0xFFB88D05),
                    // //     fontSize: 16,
                    // //     fontFamily: 'Noto Sans',
                    // //     fontWeight: FontWeight.w600,
                    // //   ),
                    // // ),
                    // // ConferenceHallDropdown(),

                    // SizedBox(
                    //   child: Container(
                    //     width: screenWidth * 0.9,
                    //     height: 50,
                    //     alignment: Alignment.center,
                    //     // width: 300,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey[200],
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(
                    //           color: Colors
                    //               .transparent), // Set border color to transparent
                    //     ),
                    //     child: Text(
                    //       '${widget.selectedConferenceHall}',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: 'Noto Sans',
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const Row(
                      children: [
                        Text(
                          'Meeting Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),

                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),

                    TextField(
                      controller: _meetingDescriptionController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                      ),
                      onChanged: (text) {
                        // Your validation logic here
                        if (text.isNotEmpty && text.length <= 500) {
                          setState(() {
                            isMeetingDescriptionValid = true;
                          });
                        } else {
                          setState(() {
                            isMeetingDescriptionValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true, // Set to true to enable background color
                        fillColor: Colors.grey[200],
                        hintText: "Enter your description here",
                        labelText: !isMeetingDescriptionValid
                            ? 'Not more than 500 letters'
                            : null,
                        border: OutlineInputBorder(
                          // Adjust these values to position the label inside the border
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Adjust these values for focused state
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // border: InputBorder
                        //     .none, // Remove the default TextField border
                      ),
                      maxLines: null,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        Text(
                          'Meeting Requested By',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    )
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     'Meeting Reported By',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 14,
                    //       fontFamily: 'Noto Sans',
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                    ,
                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    TextField(
                      controller: _meetingReportedByController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                      ),
                      onChanged: (text) {
                        // Your validation logic here
                        if (text.length <= 100) {
                          setState(() {
                            isBookingRequestedByValid = true;
                          });
                        } else {
                          setState(() {
                            isBookingRequestedByValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true, // Set to true to enable background color
                        fillColor: Colors.grey[200],
                        hintText: "Enter name here",
                        labelText: !isBookingRequestedByValid
                            ? 'Not more than 100 letters'
                            : null,
                        border: OutlineInputBorder(
                          // Adjust these values to position the label inside the border
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Adjust these values for focused state
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // border: InputBorder
                        //     .none, // Remove the default TextField border
                      ),
                      maxLines: null,
                    ),

                    Row(
                      children: [
                        const Text(
                          'Number of Attendees',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                        ),
                        attendeeItems(context),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity, // Set the desired width
                      child: ElevatedButton(
                        onPressed: _showMultiSelectDepartments,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          //foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Adjust alignment if needed
                          children: [
                            Text('Select Department'),
                            // Text(
                            //   '*',
                            //   style: TextStyle(color: Colors.red),
                            // ),
                            // SizedBox(
                            //   width: screenWidth * 0.05,
                            // ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),

                    Wrap(
                      children: _selectedDepartments
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity, // Set the desired width
                      child: ElevatedButton(
                        onPressed: _showMultiSelectAssets,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select Requirements'),
                            // Text(
                            //   '*',
                            //   style: TextStyle(color: Colors.red),
                            // ),
                            // SizedBox(
                            //   width: screenWidth * 0.05,
                            // ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),

                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    Wrap(
                      children: _selectedAssets
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        Text(
                          'Other Requirement Details (if any)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(
                        //   '*',
                        //   style: TextStyle(color: Colors.red),
                        // )
                      ],
                    ),

                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),

                    TextField(
                      controller: _otherDetailsController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                      ),
                      onChanged: (text) {
                        // Your validation logic here
                        if (text.length <= 250) {
                          setState(() {
                            isBookingRequirementDetailsByValid = true;
                          });
                        } else {
                          setState(() {
                            isBookingRequirementDetailsByValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true, // Set to true to enable background color
                        fillColor: Colors.grey[200],
                        hintText: "Enter details here",
                        labelText: !isBookingRequirementDetailsByValid
                            ? 'Not more than 250 letters'
                            : null,
                        border: OutlineInputBorder(
                          // Adjust these values to position the label inside the border
                          borderSide: const BorderSide(width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Adjust these values for focused state
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.amber),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // border: InputBorder
                        //     .none, // Remove the default TextField border
                      ),
                      maxLines: null,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1, // Set the thickness of the divider line
                    // ),
                    SizedBox(
                      width: double.infinity, // Set the desired width
                      child: ElevatedButton(
                        onPressed: _showMultiSelectStationaries,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select Stationaries'),
                            // Text(
                            //   '*',
                            //   style: TextStyle(color: Colors.red),
                            // ),
                            // SizedBox(
                            //   width: screenWidth * 0.05,
                            // ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),

                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    Wrap(
                      children: _selectedStationaries
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1, // Set the thickness of the divider line
                    // ),
                    SizedBox(
                      width: double.infinity, // Set the desired width
                      child: ElevatedButton(
                        onPressed: _showMultiSelectRefreshments,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select Refreshments'),
                            // Text(
                            //   '*',
                            //   style: TextStyle(color: Colors.red),
                            // ),
                            // SizedBox(
                            //   width: screenWidth * 0.05,
                            // ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),

                    const Divider(
                      color: Color(
                          0xFFC2C0C0), // Set the color of the divider line
                      thickness: 1, // Set the thickness of the divider line
                    ),
                    Wrap(
                      children: _selectedRefreshments
                          .map((e) => Chip(
                                label: Text(e),
                              ))
                          .toList(),
                    ),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // // Divider(
                    // //   color: Color(
                    // //       0xFFC2C0C0), // Set the color of the divider line
                    // //   thickness: 1, // Set the thickness of the divider line
                    // // ),
                    //
                    // SizedBox(
                    //   height: 20,
                    // ),

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
                    // Divider(
                    //   color: Color(
                    //       0xFFC2C0C0), // Set the color of the divider line
                    //   thickness: 1, // Set the thickness of the divider line
                    // ),

                    // Wrap(
                    //   children: _selectedDepartments
                    //       .map((e) => Chip(
                    //             label: Text(e),
                    //           ))
                    //       .toList(),
                    // ),
                    //
                    // SizedBox(
                    //   height: 20,
                    // ),

                    const SizedBox(
                      height: 20,
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

                    const SizedBox(
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
                                const CircleBorder(), // Use CircleBorder to make the button circular
                            backgroundColor: Colors
                                .grey, // Change the button color to your preference
                            padding: const EdgeInsets.all(
                                16.0), // Adjust the padding as needed
                          ),
                          child: const Icon(
                            Icons
                                .cancel, // You can use your preferred edit icon here
                            color: Colors
                                .white, // Change the icon color to your preference
                          ),
                        ),
                        if (showLoadingInPlaceOfSubmitButton == false)
                          ElevatedButton(
                            onPressed: () {
                              _showAddNewBookingConfirmationDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape:
                                  const CircleBorder(), // Use CircleBorder to make the button circular
                              backgroundColor: Colors
                                  .grey, // Change the button color to your preference
                              padding: const EdgeInsets.all(
                                  16.0), // Adjust the padding as needed
                            ),
                            child: const Icon(
                              Icons
                                  .check_circle, // You can use your preferred edit icon here
                              color: Colors
                                  .white, // Change the icon color to your preference
                            ),
                          )
                        else
                          const CircularProgressIndicator(),
                      ],
                    ),
                    const SizedBox(
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

class MultiSelectDepartments extends StatefulWidget {
  final List<String> departments;
  final List<String> initialSelectedDepartments; // New property
  const MultiSelectDepartments(
      {Key? key,
      required this.departments,
      required this.initialSelectedDepartments})
      : super(key: key);

  @override
  State<MultiSelectDepartments> createState() => _MultiSelectDepartmentsState();
}

class _MultiSelectDepartmentsState extends State<MultiSelectDepartments> {
  // this variable holds the selected departments
  late List<String> _selectedDepartments;

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
  // void _cancel() {
  //   Navigator.pop(context);
  // }

  // this function is called when the submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedDepartments);
  }

  @override
  void initState() {
    super.initState();
    _selectedDepartments = widget.initialSelectedDepartments;
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
        // TextButton(
        //   onPressed: _cancel,
        //   child: const Text('Cancel'),
        // ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        )
      ],
    );
  }
}

class MultiSelectRefreshments extends StatefulWidget {
  final List<String> refreshments;
  final List<String> initialSelectedRefreshments; // New property
  const MultiSelectRefreshments(
      {Key? key,
      required this.refreshments,
      required this.initialSelectedRefreshments})
      : super(key: key);

  @override
  State<MultiSelectRefreshments> createState() =>
      _MultiSelectRefreshmentsState();
}

class _MultiSelectRefreshmentsState extends State<MultiSelectRefreshments> {
  // this variable holds the selected departments
  late List<String> _selectedRefreshments;

  // This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedRefreshments.add(itemValue);
      } else {
        _selectedRefreshments.remove(itemValue);
      }
    });
  }

  // This function is called when the cancel button is pressed
  // void _cancel() {
  //   Navigator.pop(context);
  // }

  // this function is called when the submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedRefreshments);
  }

  @override
  void initState() {
    super.initState();
    _selectedRefreshments = widget.initialSelectedRefreshments;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Refreshments'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.refreshments
            .map((refreshment) => CheckboxListTile(
                  value: _selectedRefreshments.contains(refreshment),
                  title: Text(refreshment),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) =>
                      _itemChange(refreshment, isChecked!),
                ))
            .toList(),
      )),
      actions: [
        // TextButton(
        //   onPressed: _cancel,
        //   child: const Text('Cancel'),
        // ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        )
      ],
    );
  }
}

class MultiSelectStationaries extends StatefulWidget {
  final List<String> stationaries;
  final List<String> initialSelectedStationaries; // New property
  const MultiSelectStationaries(
      {Key? key,
      required this.stationaries,
      required this.initialSelectedStationaries})
      : super(key: key);

  @override
  State<MultiSelectStationaries> createState() =>
      _MultiSelectStationariesState();
}

class _MultiSelectStationariesState extends State<MultiSelectStationaries> {
  // this variable holds the selected departments
  late List<String> _selectedStationaries;

  // This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedStationaries.add(itemValue);
      } else {
        _selectedStationaries.remove(itemValue);
      }
    });
  }

  // This function is called when the cancel button is pressed
  // void _cancel() {
  //   Navigator.pop(context);
  // }

  // this function is called when the submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedStationaries);
  }

  @override
  void initState() {
    super.initState();
    _selectedStationaries = widget.initialSelectedStationaries;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Stationaries'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.stationaries
            .map((stationaries) => CheckboxListTile(
                  value: _selectedStationaries.contains(stationaries),
                  title: Text(stationaries),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) =>
                      _itemChange(stationaries, isChecked!),
                ))
            .toList(),
      )),
      actions: [
        // TextButton(
        //   onPressed: _cancel,
        //   child: const Text('Cancel'),
        // ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        )
      ],
    );
  }
}

class MultiSelectAssetRequirements extends StatefulWidget {
  final List<String> assets;
  final List<String> initialSelectedAssets; // New property
  const MultiSelectAssetRequirements(
      {Key? key, required this.assets, required this.initialSelectedAssets})
      : super(key: key);

  @override
  State<MultiSelectAssetRequirements> createState() =>
      _MultiSelectAssetRequirementsState();
}

class _MultiSelectAssetRequirementsState
    extends State<MultiSelectAssetRequirements> {
  // this variable holds the selected departments
  late List<String> _selectedAssets;

  // This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedAssets.add(itemValue);
      } else {
        _selectedAssets.remove(itemValue);
      }
    });
  }

  // This function is called when the cancel button is pressed
  // void _cancel() {
  //   Navigator.pop(context);
  // }

  // this function is called when the submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedAssets);
  }

  @override
  void initState() {
    super.initState();
    _selectedAssets = widget.initialSelectedAssets;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Assets'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.assets
            .map((refreshment) => CheckboxListTile(
                  value: _selectedAssets.contains(refreshment),
                  title: Text(refreshment),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) =>
                      _itemChange(refreshment, isChecked!),
                ))
            .toList(),
      )),
      actions: [
        // TextButton(
        //   onPressed: _cancel,
        //   child: const Text('Cancel'),
        // ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Ok'),
        )
      ],
    );
  }
}
