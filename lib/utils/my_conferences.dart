import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class MyConferences extends StatefulWidget {
  MyConferences({super.key});

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
    print('${listOfMyMeetings} 00000000000');
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
            height: screenHeight * 0.35,
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

                  print(bookingData);
                  return Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.027,
                          screenHeight * 0.01,
                          screenWidth * 0,
                          screenHeight * 0.01),
                      child: Container(
                        key: ValueKey(bookingData.bookingId),
                        width: screenWidth * 0.5,
                        // height: screenHeight * 0.2,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 3,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02,
                                  horizontal: screenWidth * 0.01,
                                ),
                                child: Image.asset(
                                  "assets/images/conference_hall_images/${conferenceHallImageName}",
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.1,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add your onPressed callback function here
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                              currentBookingData: bookingData,
                                              currentConferenceRoomName:
                                                  conferenceHallName,
                                              currentLocationName: locationName,
                                              currentConferenceHallImageName:
                                                  conferenceHallImageName)));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color(0x59FFC304), // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 4, // Shadow blur radius
                                ),
                                child: Container(
                                  width: 91,
                                  height: 27,
                                  child: const Center(
                                    child: Text(
                                      "View Detail",
                                      style: TextStyle(
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  //   child: Text(
                                  // 'Conference Room Floor - 02',
                                  child: Text(
                                conferenceHallName,
                                style: TextStyle(
                                  color: Color(0xFFB88D05),
                                  fontSize: 11,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              const Divider(
                                indent: 10,
                                endIndent: 10,
                                color: Color(
                                    0xFFC2C0C0), // Set the color of the divider line
                                thickness:
                                    1, // Set the thickness of the divider line
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      '${bookingData.bookingMeetingTitle}',
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFFB88D05),
                                        fontSize: 15,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )),
                              Row(
                                children: [
                                  // SizedBox(
                                  //     width:
                                  //         8), // Add some spacing between the icon and text
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 0,
                                            ),
                                            child: Column(
                                              children: [
                                                Divider(),
                                                Row(children: [
                                                  SizedBox(width: 8),
                                                  Icon(
                                                    Icons
                                                        .date_range, // Replace with the icon you want
                                                    color: Color(
                                                        0xFF696767), // Set the color of the icon
                                                    size:
                                                        20, // Set the size of the icon
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      '${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)}',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF696767),
                                                        fontSize: 12,
                                                        fontFamily: 'Noto Sans',
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                    SizedBox(width: 8),
                                                    Icon(
                                                      Icons
                                                          .av_timer, // Replace with the icon you want
                                                      color: Color(
                                                          0xFF696767), // Set the color of the icon
                                                      size:
                                                          20, // Set the size of the icon
                                                    ),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          '${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF696767),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Noto Sans',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )))
                                ],
                              )
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
