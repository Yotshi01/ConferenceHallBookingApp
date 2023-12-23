import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class MyConferences extends StatefulWidget {
  const MyConferences({super.key});

  @override
  State<MyConferences> createState() => _MyConferencesState();
}

class _MyConferencesState extends State<MyConferences> {
  // listOfMyMeetings;

  @override
  Widget build(BuildContext context) {
    final List<BookingData> finalBookings = isSearched == false
        ? listOfMyMeetings
        : listOfFoundBookingsFromMyMeetings;
    // print('${listOfMyMeetings} 00000000000');
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
                  final conferenceHallName = bookingData.bookingConferenceId !=
                          null
                      ? getConferenceHallName(bookingData.bookingConferenceId!)
                      : 'Unknown Conference Hall';

                  final locationName = bookingData.bookingLocationId != null
                      ? getLocationName(bookingData.bookingLocationId!)
                      : 'Unknown Location';

                  // print(bookingData);
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        key: ValueKey(bookingData.bookingId),
                        width: screenWidth * 0.55,
                        // height: screenHeight * 0.2,
                        decoration: ShapeDecoration(
                          color: Colors.amber[50],
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
                              // Row(
                              //   children: [
                              //
                              //     SizedBox(
                              //       width: 0.001,
                              //     ),
                              //                               PopupMenuButton<String>(
                              //                                 itemBuilder: (BuildContext context) =>
                              //                                     <PopupMenuEntry<String>>[
                              //                                   PopupMenuItem<String>(
                              //                                     value: 'view_details',
                              //                                     child: ListTile(
                              //                                       leading: Icon(Icons.info_outline),
                              //                                       title: Text('View Details'),
                              //                                     ),
                              //                                   ),
                              //                                   PopupMenuItem<String>(
                              //                                     value: 'share',
                              //                                     child: ListTile(
                              //                                       leading: Icon(Icons.share),
                              //                                       title: Text('Share'),
                              //                                     ),
                              //                                   ),
                              //                                 ],
                              //                                 onSelected: (String value) {
                              //                                   if (value == 'view_details') {
                              //                                     navigatorKeys[BottomNavBarItem.home]!
                              //                                         .currentState!
                              //                                         .push(
                              //                                           MaterialPageRoute(
                              //                                               builder: (context) => DetailsScreen(
                              //                                                   currentBookingData:
                              //                                                       bookingData,
                              //                                                   currentConferenceRoomName:
                              //                                                       conferenceHallName,
                              //                                                   currentLocationName:
                              //                                                       locationName,
                              //                                                   currentConferenceHallImageName:
                              //                                                       conferenceHallImageName)),
                              //                                         );
                              //                                     // // Add your onPressed callback function here
                              //                                     // Navigator.push(
                              //                                     //     context,
                              //                                     //     MaterialPageRoute(
                              //                                     //         builder: (context) => DetailsScreen(
                              //                                     //             currentBookingData: bookingData,
                              //                                     //             currentConferenceRoomName:
                              //                                     //                 conferenceHallName,
                              //                                     //             currentLocationName: locationName,
                              //                                     //             currentConferenceHallImageName:
                              //                                     //                 conferenceHallImageName)));
                              //
                              //                                     // Navigate to view details screen
                              //                                     // Your navigation code goes here
                              //                                   } else if (value == 'share') {
                              //                                     // Construct the message with basic information
                              //                                     String message = '''
                              //   Meeting Title: ${bookingData.bookingMeetingTitle}
                              //   Date: ${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}
                              //   Time: ${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}
                              //   Conference Hall: ${conferenceHallName}
                              //   Location: ${locationName}
                              //
                              // ''';
                              //
                              //                                     // Share the message
                              //                                     Share.share(message);
                              //                                     // await Share.share(
                              //                                     //     'This a test message to test the capablity of our app to share data :), And lets introduce the helper for it -----> https://pub.dev/packages/share_plus');
                              //
                              //                                     // Share functionality
                              //                                     // Your share functionality goes here
                              //                                   }
                              //                                 },
                              //     //                               ),
                              //   ],
                              // ),

                              // SizedBox(
                              //     //   child: Text(
                              //     // 'Conference Room Floor - 02',
                              //     child: Text(
                              //   conferenceHallName,
                              //   style: TextStyle(
                              //     color: Color(0xFFB88D05),
                              //     fontSize: 11,
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
                              // ),SizedBox(
                              //                                     width: screenWidth * 0.3775,
                              //                                     child: Expanded(
                              //                                       child:

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.symmetric(
                                  //       horizontal: 10,
                                  //     ),
                                  //     child: Text(
                                  //       '${bookingData.bookingMeetingTitle}',
                                  //       // textAlign: TextAlign.left,
                                  //       style: const TextStyle(
                                  //         color: Color(0xFFB88D05),
                                  //         fontSize: 15,
                                  //         fontFamily: 'Noto Sans',
                                  //         fontWeight: FontWeight.w500,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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

                                  // SizedBox(
                                  //   width: screenWidth * 0.242,
                                  // ),
                                  PopupMenuButton<String>(
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'view_details',
                                        child: ListTile(
                                          leading: Icon(Icons.info_outline),
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
                                        navigatorKeys[BottomNavBarItem.home]!
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
                                  ),
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
                                  width: screenWidth * 0.18,
                                  height: screenHeight * 0.1,
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

                              // SizedBox(
                              //     width:
                              //         8), // Add some spacing between the icon and text
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const SizedBox(width: 8),
                                          const Icon(
                                            Icons
                                                .date_range, // Replace with the icon you want
                                            color: Color(
                                                0xFF696767), // Set the color of the icon
                                            size:
                                                20, // Set the size of the icon
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
                                        ]),
                                        // Align(
                                        //   alignment:
                                        //       Alignment.centerLeft,
                                        //   child: Text(
                                        //     '${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}',
                                        //     style: TextStyle(
                                        //       color: Color(0xFF696767),
                                        //       fontSize: 12,
                                        //       fontFamily: 'Noto Sans',
                                        //       fontWeight:
                                        //           FontWeight.w500,
                                        //     ),
                                        //   ),
                                        // ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons
                                                  .av_timer, // Replace with the icon you want
                                              color: Color(
                                                  0xFF696767), // Set the color of the icon
                                              size:
                                                  20, // Set the size of the icon
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
                                                style: const TextStyle(
                                                  color: Color(0xFF696767),
                                                  fontSize: 12.1,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                            ]),
                      ));
                }))
        : const Center(
            child: Text(
              'No meetings initiated by me',
              style: TextStyle(fontSize: 13),
            ),
          );
  }
}
