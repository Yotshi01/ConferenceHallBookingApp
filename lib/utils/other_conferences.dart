import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class OtherConferences extends StatefulWidget {
  const OtherConferences({super.key});

  @override
  State<OtherConferences> createState() => _OtherConferencesState();
}

class _OtherConferencesState extends State<OtherConferences> {
  @override
  Widget build(BuildContext context) {
    final List<BookingData> finalBookings = (isSearched == false)
        ? listOfOtherMeetings
        : listOfFoundBookingsFromOtherMeetings;
    // print('${isSearched} searched searched');
    // print('${finalBookings} final final final it is');
    return finalBookings.isNotEmpty
        ? SizedBox(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment(0.21, -0.98),
            //     end: Alignment(-0.21, 0.98),
            //     colors: [Colors.white, Color(0x00DBCC95)],
            //   ),
            // ),
            // color: Colors.blue,
            height: screenHeight * 0.45,
            child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemCount: finalBookings.length,
                itemBuilder: (context, index) {
                  final bookingData = finalBookings[index];
                  final conferenceHallImageName = getConferenceHallImageName(
                      bookingData.bookingConferenceId!);
                  // print('${conferenceHallImageName} dsfnkdcsc');
                  final conferenceHallName = bookingData.bookingConferenceId !=
                          null
                      ? getConferenceHallName(bookingData.bookingConferenceId!)
                      : 'Unknown Conference Hall';

                  final bookingBookedByUserName = bookingData.userId != null
                      ? getUserNameById(bookingData.userId!)
                      : 'Unknown User';

                  final currentBookingDate =
                      DateTime.tryParse(bookingData.bookingDate!);

                  // final locationName = bookingData.bookingLocationId != null
                  //     ? getLocationName(bookingData.bookingLocationId!)
                  //     : 'Unknown Location';

                  // print("${bookingData} cnkajcajajc");
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        key: ValueKey(bookingData.bookingId),
                        width: screenWidth * 0.55,
                        // height: screenHeight * 0.2,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 3,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Text(
                              //   '${bookingData.userId}',
                              //   // textAlign: TextAlign.left,
                              //   style: TextStyle(
                              //     //color: Colors.black,
                              //     color: Color(0xFFB88D05),
                              //     fontSize: 16,
                              //     fontFamily: 'Noto Sans',
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      '${bookingData.bookingMeetingTitle}',
                                      // textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Color(0xFFB88D05),
                                        fontSize: 15,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )),
                                  // SizedBox(
                                  //   width: screenWidth * 0.09,
                                  // ),

                                  //mainaxisalignment: Alignment.topRight,
                                  if (currentBookingDate!
                                          .isAfter(DateTime.now()) ||
                                      ((currentBookingDate!.day ==
                                              DateTime.now().day &&
                                          currentBookingDate!.month ==
                                              DateTime.now().month &&
                                          currentBookingDate!.year ==
                                              DateTime.now().year &&
                                          ((hourPartOfStringTime(bookingData
                                                      .bookingEndTime!) >
                                                  DateTime.now().hour) ||
                                              ((hourPartOfStringTime(bookingData
                                                          .bookingEndTime!) ==
                                                      DateTime.now().hour) &&
                                                  (minutePartOfStringTime(
                                                          bookingData
                                                              .bookingEndTime!) >
                                                      DateTime.now()
                                                          .minute))))))
                                    if (isRequestStatusOfCurrentUserOnThisBookingIdPending(
                                            bookingData.bookingId!) !=
                                        true)
                                      MeetingUpdateButtons(
                                        bookingUserId: bookingData.userId!,
                                        bookingId: bookingData.bookingId!,
                                      )
                                    else
                                      ElevatedButton(
                                          onPressed: null,
                                          style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(40, 40)),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.zero),
                                          ),
                                          child: const Stack(
                                            children: [
                                              Icon(Icons.outgoing_mail),
                                              Icon(Icons.check, size: 40),
                                            ],
                                          ))
                                  else
                                    Container(),
                                ],
                              ),
                              const Divider(
                                indent: 10,
                                endIndent: 10,
                                color: Color(
                                    0xFFC2C0C0), // Set the color of the divider line
                                thickness:
                                    1, // Set the thickness of the divider line
                              ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: screenHeight * 0.02,
                              //     horizontal: screenWidth * 0.01,
                              //   ),
                              //   child: Image.asset(
                              //     "assets/images/conference_hall_images/${conferenceHallImageName}",
                              //     width: screenWidth * 0.3,
                              //     height: screenHeight * 0.1,
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0,
                                  horizontal: screenWidth * 0,
                                ),
                                child: Image.network(
                                  "${testBaseUrl}/uploads/conferences/${conferenceHallImageName}",
                                  width: screenWidth * 0.24,
                                  height: screenHeight * 0.15,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return const Text('Error loading image');
                                  },
                                ),
                              ),
                              // ElevatedButton(
                              //   onPressed: () {
                              // navigatorKeys[BottomNavBarItem.home]!
                              //       .currentState!
                              //       .push(
                              //         MaterialPageRoute(
                              //             builder: (context) => DetailsScreen(
                              //                 currentConferenceRoomName:
                              //                   conferenceHallName,
                              //               currentLocationName: locationName,
                              //               currentConferenceHallImageName:
                              //                   conferenceHallImageName)),
                              //       );
                              //   // Add your onPressed callback function here
                              //   // Navigator.push(
                              //   //     context,
                              //   //     MaterialPageRoute(
                              //   //         builder: (context) => DetailsScreen(
                              //   //             currentBookingData: bookingData,
                              //   //             currentConferenceRoomName:
                              //   //                 conferenceHallName,
                              //   //             currentLocationName: locationName,
                              //   //             currentConferenceHallImageName:
                              //   //                 conferenceHallImageName)));
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor:
                              //         Color(0x59FFC304), // Background color
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(15),
                              //     ),
                              //     elevation: 4, // Shadow blur radius
                              //   ),
                              //   child: Container(
                              //     width: 91,
                              //     height: 27,
                              //     child: const Center(
                              //       child: Text(
                              //         "View Detail",
                              //         style: TextStyle(
                              //           color: Colors.black, // Text color
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              // Align(
                              //   alignment: Alignment.center,
                              //   child: MeetingUpdateButtons(
                              //     bookingUserId: bookingData.userId!,
                              //     bookingId: bookingData.bookingId!,
                              //   ),
                              // ),
                              //

                              //Divider(),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons
                                        .date_range, // Replace with the icon you want
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 20, // Set the size of the icon
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}',
                                      style: const TextStyle(
                                        color: Color(0xFF696767),
                                        fontSize: 12,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  // SizedBox(
                                  //     width:
                                  //         8), // Add some spacing between the icon and text
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons
                                        .av_timer, // Replace with the icon you want
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 20, // Set the size of the icon
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}',
                                        style: const TextStyle(
                                          color: Color(0xFF696767),
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.meeting_room_outlined,
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 20,
                                  ),
                                  Expanded(
                                      child: Text(
                                    conferenceHallName,
                                    style: const TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 12.1,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.person,
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 20,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Raised By: $bookingBookedByUserName',
                                    style: const TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 12.1,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                                ],
                              ),
                            ]),
                      ));
                }))
        : const Center(
            child: Text(
              'No results found',
              style: TextStyle(fontSize: 13),
            ),
          );
  }
}
