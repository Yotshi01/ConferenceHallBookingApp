import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class TodaysConferences extends StatefulWidget {
  const TodaysConferences({super.key});

  @override
  State<TodaysConferences> createState() => _TodaysConferencesState();
}

class _TodaysConferencesState extends State<TodaysConferences> {
  @override
  Widget build(BuildContext context) {
    final List<BookingData> finalBookings = (isSearched == false)
        ? listOfTodayMeetings
        : listOfFoundBookingFromTodayMeetings;
    // print('${isSearched} searched searched');
    // print('${finalBookings} final final final it is');
    return finalBookings.isNotEmpty
        ? SizedBox(
            height: screenHeight * 0.45,
            child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemCount: finalBookings.length,
                itemBuilder: (context, index) {
                  final bookingData = finalBookings[index];
                  final conferenceHallImageName = getConferenceHallImageName(
                      bookingData.bookingConferenceId!);
                  // print('${bookingData.bookingLocationId} dvdzdvzcvcvz');
                  // print('${bookingData.bookingConferenceId} czsfvdzbzzbx');
                  final conferenceHallName = bookingData.bookingConferenceId !=
                          null
                      ? getConferenceHallName(bookingData.bookingConferenceId!)
                      : 'Unknown Conference Hall';

                  final locationName = bookingData.bookingLocationId != null
                      ? getLocationName(bookingData.bookingLocationId!)
                      : 'Unknown Location';

                  final bookingBookedByUserName = bookingData.userId != null
                      ? getUserNameById(bookingData.userId!)
                      : 'Unknown User';

                  final currentBookingDate =
                      DateTime.tryParse(bookingData.bookingDate!);

                  // print(bookingData);
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        key: ValueKey(bookingData.bookingId),
                        width: screenWidth * 0.55,
                        //height: screenHeight * 0.7,
                        decoration: ShapeDecoration(
                          color: (currentUserData!.id == bookingData.userId)
                              ? Colors.amber[50]
                              : Colors.white,
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
                            mainAxisSize:
                                MainAxisSize.min, // Set mainAxisSize to min
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Expanded(
                                  //     child: Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10,
                                  //   ),
                                  //   child: Text(
                                  //     '${truncateMeetingTitle(bookingData.bookingMeetingTitle!)}',
                                  //     // textAlign: TextAlign.left,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFB88D05),
                                  //       fontSize: 15,
                                  //       fontFamily: 'Noto Sans',
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  // )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: (bookingData
                                                  .bookingMeetingTitle!.length >
                                              50)
                                          ? GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      // title: const Text(
                                                      //     'Full Text'),
                                                      content: Text(bookingData
                                                          .bookingMeetingTitle!),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Close'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text(
                                                '${truncateMeetingTitle(bookingData.bookingMeetingTitle!)}',
                                                style: const TextStyle(
                                                  color: Color(0xFFB88D05),
                                                  fontSize: 15,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              '${bookingData.bookingMeetingTitle}',
                                              style: const TextStyle(
                                                color: Color(0xFFB88D05),
                                                fontSize: 15,
                                                fontFamily: 'Noto Sans',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                    ),
                                  ),

                                  if (currentUserData!.id == bookingData.userId)
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.end,
                                          children: [
                                            // SizedBox(
                                            //   width: screenWidth * 0.242,
                                            // ),
                                            PopupMenuButton<String>(
                                              itemBuilder:
                                                  (BuildContext context) =>
                                                      <PopupMenuEntry<String>>[
                                                const PopupMenuItem<String>(
                                                  value: 'view_details',
                                                  child: ListTile(
                                                    leading: Icon(
                                                        Icons.info_outline),
                                                    title: Text('View Details'),
                                                  ),
                                                ),
                                                const PopupMenuItem<String>(
                                                  value: 'share',
                                                  child: ListTile(
                                                    leading: Icon(Icons.share),
                                                    title: Text('Share'),
                                                  ),
                                                ),
                                              ],
                                              onSelected: (String value) {
                                                if (value == 'view_details') {
                                                  navigatorKeys[BottomNavBarItem
                                                          .home]!
                                                      .currentState!
                                                      .push(
                                                        MaterialPageRoute(
                                                            builder: (context) => DetailsScreen(
                                                                currentBookingData:
                                                                    bookingData,
                                                                currentConferenceRoomName:
                                                                    conferenceHallName,
                                                                currentLocationName:
                                                                    locationName,
                                                                currentConferenceHallImageName:
                                                                    conferenceHallImageName)),
                                                      );
                                                  // // Add your onPressed callback function here
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) => DetailsScreen(
                                                  //             currentBookingData: bookingData,
                                                  //             currentConferenceRoomName:
                                                  //                 conferenceHallName,
                                                  //             currentLocationName: locationName,
                                                  //             currentConferenceHallImageName:
                                                  //                 conferenceHallImageName)));

                                                  // Navigate to view details screen
                                                  // Your navigation code goes here
                                                } else if (value == 'share') {
                                                  // Construct the message with basic information

                                                  String message = '''
      Meeting Title: ${bookingData.bookingMeetingTitle}
      Date: ${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}
      Time: ${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}
      Conference Hall: ${conferenceHallName}
      Location: ${locationName}
      
    ''';

                                                  // Share the message
                                                  Share.share(message);
                                                  // await Share.share(
                                                  //     'This a test message to test the capablity of our app to share data :), And lets introduce the helper for it -----> https://pub.dev/packages/share_plus');

                                                  // Share functionality
                                                  // Your share functionality goes here
                                                }
                                              },
                                            )
                                          ],
                                        ))
                                  else if (currentBookingDate!
                                          .isAfter(DateTime.now()) ||
                                      ((currentBookingDate!.day ==
                                              DateTime.now().day &&
                                          currentBookingDate!.month ==
                                              DateTime.now().month &&
                                          currentBookingDate!.year ==
                                              DateTime.now().year &&
                                          ((hourPartOfStringTime(bookingData
                                                      .bookingStartTime!) >
                                                  DateTime.now().hour) ||
                                              ((hourPartOfStringTime(bookingData
                                                          .bookingStartTime!) ==
                                                      DateTime.now().hour) &&
                                                  (minutePartOfStringTime(
                                                          bookingData
                                                              .bookingStartTime!) >
                                                      DateTime.now()
                                                          .minute))))))
                                    if (isRequestStatusOfCurrentUserOnThisBookingIdPending(
                                            bookingData.bookingId!) !=
                                        true)
                                      Row(
                                        children: [
                                          // SizedBox(
                                          //   width: screenWidth * 0.28,
                                          // ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: MeetingUpdateButtons(
                                              bookingUserId:
                                                  bookingData.userId!,
                                              bookingId: bookingData.bookingId!,
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: ElevatedButton(
                                            onPressed: null,
                                            style: ButtonStyle(
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      const Size(40, 40)),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.zero),
                                            ),
                                            child:
                                                const Icon(Icons.outgoing_mail),
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
                              //                             Align(
                              //                               alignment: Alignment.centerRight,
                              //                               child: ElevatedButton(
                              //                                 onPressed: () async {
                              //                                   // Construct the message with basic information
                              //                                   String message = '''
                              //   Meeting Title: ${bookingData.bookingMeetingTitle}
                              //   Date: ${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}
                              //   Time: ${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}
                              //   Conference Hall: ${conferenceHallName}
                              //   Location: ${locationName}
                              //
                              // ''';
                              //
                              //                                   // Share the message
                              //                                   await Share.share(message);
                              //                                   // await Share.share(
                              //                                   //     'This a test message to test the capablity of our app to share data :), And lets introduce the helper for it -----> https://pub.dev/packages/share_plus');
                              //                                 },
                              //                                 style: ElevatedButton.styleFrom(
                              //                                   shape:
                              //                                       CircleBorder(), // Use CircleBorder to make the button circular
                              //                                   backgroundColor: Colors.brown[
                              //                                       100], // Change the button color to your preference
                              //                                   padding: EdgeInsets.all(
                              //                                       10.0), // Adjust the padding as needed
                              //                                 ),
                              //                                 child: Icon(
                              //                                   Icons
                              //                                       .share, // You can use your preferred edit icon here
                              //                                   color: Colors
                              //                                       .white, // Change the icon color to your preference
                              //                                   // size: 15
                              //                                 ),
                              //                               ),
                              //                             ),
                              // SizedBox(
                              //   height: screenHeight * 0.01,
                              // ),
                              // Row(
                              //   children: [
                              //     SizedBox(width: screenWidth * 0.02),
                              //     //Text('${bookingData.bookingDate}'),
                              //     // SizedBox(width: screenWidth * 0.21),
                              //     // Text(
                              //     //   '${bookingData.userId}',
                              //     //   // textAlign: TextAlign.left,
                              //     //   style: TextStyle(
                              //     //     //color: Colors.black,
                              //     //     color: Color(0xFFB88D05),
                              //     //     fontSize: 16,
                              //     //     fontFamily: 'Noto Sans',
                              //     //     fontWeight: FontWeight.w500,
                              //     //   ),
                              //     // ),
                              //   ],
                              // ),
                              //'${bookingData.bookingDate} |
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: screenHeight * 0.015,
                              //     horizontal: screenWidth * 0.009,
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

                              // if (bookingData.userId != currentUserData!.id)
                              // ElevatedButton(
                              //   onPressed: () {
                              //     navigatorKeys[BottomNavBarItem.home]!
                              //         .currentState!
                              //         .push(
                              //           MaterialPageRoute(
                              //               builder: (context) => DetailsScreen(
                              //                   currentBookingData:
                              //                       bookingData,
                              //                   currentConferenceRoomName:
                              //                       conferenceHallName,
                              //                   currentLocationName:
                              //                       locationName,
                              //                   currentConferenceHallImageName:
                              //                       conferenceHallImageName)),
                              //         );
                              //     // Add your onPressed callback function here
                              //     // Navigator.push(
                              //     //     context,
                              //     //     MaterialPageRoute(
                              //     //         builder: (context) => DetailsScreen(
                              //     // currentBookingData: bookingData,
                              //     // currentConferenceRoomName:
                              //     //     conferenceHallName,
                              //     // currentLocationName: locationName,
                              //     // currentConferenceHallImageName:
                              //     //     conferenceHallImageName)));
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
                              // )
                              // Column(
                              //   children: [
                              //
                              //   ],
                              // )

                              // Align(
                              //   alignment: Alignment.center,
                              //   child: MeetingUpdateButtons(
                              //     bookingUserId: bookingData.userId!,
                              //     bookingId: bookingData.bookingId!,
                              //   ),
                              // ),

                              // SizedBox(
                              //     //   child: Text(
                              //     // 'Conference Room Floor - 02',
                              //     child: Text(
                              //   conferenceHallName,
                              //   style: TextStyle(
                              //     color: Color(0xFFB88D05),
                              //     fontSize: 13,
                              //     fontFamily: 'Noto Sans',
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // )),
                              // const Divider(
                              //   indent: 10,
                              //   endIndent: 10,
                              //   color: Color(
                              //       0xFFC2C0C0), // Set the color of the divider line
                              //   thickness:
                              //       1, // Set the thickness of the divider line
                              // ),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Padding(
                              //       padding: EdgeInsets.symmetric(
                              //         horizontal: 10,
                              //       ),
                              //       child: Text(
                              //         '${bookingData.bookingMeetingTitle}',
                              //         // textAlign: TextAlign.left,
                              //         style: TextStyle(
                              //           color: Colors.black,
                              //           fontSize: 14,
                              //           fontFamily: 'Noto Sans',
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     )),
                              // const Divider(
                              //   indent: 10,
                              //   endIndent: 10,
                              //   color: Color(
                              //       0xFFC2C0C0), // Set the color of the divider line
                              //   thickness:
                              //       1, // Set the thickness of the divider line
                              // ),
                              Row(
                                children: [
                                  // SizedBox(
                                  //     width:
                                  //         8), // Add some spacing between the icon and text
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.02,
                                            ),
                                            const Icon(
                                              Icons
                                                  .av_timer, // Replace with the icon you want
                                              color: Color(0xFF696767),
                                              //     0xFF696767), // Set the color of the icon
                                              size:
                                                  20, // Set the size of the icon
                                            ),
                                            Text(
                                              '${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}',
                                              style: const TextStyle(
                                                color: Color(0xFF696767),
                                                fontSize: 12,
                                                fontFamily: 'Noto Sans',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
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
                                    Icons.short_text_rounded,
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      // '${getLocationShortNameByLocationId(bookingData.bookingLocationId!)}-${getConferenceHallShortNameByConferenceHallId(bookingData.bookingConferenceId!)}',
                                      '${bookingData.bookingNumber}',
                                      style: const TextStyle(
                                        color: Color(0xFF696767),
                                        fontSize: 12.1,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
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
                                      '${conferenceHallName}, ${locationName}',
                                      // '${getLocationShortNameByLocationId(bookingData.bookingLocationId!)}-${getConferenceHallShortNameByConferenceHallId(bookingData.bookingConferenceId!)}',
                                      style: const TextStyle(
                                        color: Color(0xFF696767),
                                        fontSize: 12.1,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              if (bookingData.userId != currentUserData!.id)
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
              'No meetings today',
              style: TextStyle(fontSize: 13),
            ),
          );
  }
}
