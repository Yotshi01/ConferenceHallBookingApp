import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class MyOldConferences extends StatefulWidget {
  MyOldConferences({super.key});

  @override
  State<MyOldConferences> createState() => _MyOldConferencesState();
}

class _MyOldConferencesState extends State<MyOldConferences> {
  // listOfMyMeetings;

  @override
  Widget build(BuildContext context) {
    final List<BookingData> finalBookings = isSearched == false
        ? listOfMyOldMeetings
        : listOfFoundBookingsFromMyOldMeetings;
    print('${listOfMyOldMeetings} dsjnoldoldoldoldoldoldoldoldoldold');
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
            height: screenHeight * 0.25,
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
                          screenHeight * 0.05),
                      child: Container(
                        key: ValueKey(bookingData.bookingId),
                        width: screenWidth * 0.5,
                        //height: screenHeight * 0.1,
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: screenHeight * 0.02,
                              //     horizontal: screenWidth * 0.01,
                              //   ),
                              //   child: Image.asset(
                              //     "assets/images/meeting-room5.png",
                              //     width: screenWidth * 0.3,
                              //     height: screenHeight * 0.1,
                              //   ),
                              // ),
                              SizedBox(
                                height: screenHeight * 0.013,
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
                                        //color: Colors.black,
                                        color: Color(0xFFB88D05),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
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
                              Row(
                                children: [
                                  SizedBox(
                                      width: screenWidth *
                                          0.024), // Add some spacing between the icon and text
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0,
                                              ),
                                              child: Text(
                                                '${convertStringDateIntoDesiredFormat(bookingData.bookingDate!)} | ${convertStringTimeIntoDesiredFormat(bookingData.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(bookingData.bookingEndTime!)}',
                                                style: TextStyle(
                                                  color: Color(0xFF696767),
                                                  fontSize: 13,
                                                  fontFamily: 'Noto Sans',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ))))
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.007),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        conferenceHallName,
                                        style: TextStyle(
                                          color: Color(0xFFB88D05),
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ))),
                              SizedBox(
                                height: screenHeight * 0.0115,
                              ),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed callback function here
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                currentBookingData: bookingData,
                                                currentConferenceRoomName:
                                                    conferenceHallName,
                                                currentLocationName:
                                                    locationName,
                                                currentConferenceHallImageName:
                                                    conferenceHallImageName)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    //Color(0x59FFC304), // Background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xFFB88D05), width: 2),
                                    ),
                                    elevation: 1, // Shadow blur radius
                                  ),
                                  child: Container(
                                    width: 60,
                                    height: 10,
                                    child: const Center(
                                      child: Text(
                                        "More Details",
                                        style: TextStyle(
                                          color: Color(0xFFB88D05),
                                          fontSize: 10, //
                                          // Text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ));
                }))
        : const Center(
            child: Text(
              'No old meetings',
              style: TextStyle(fontSize: 13),
            ),
          );
  }
}
