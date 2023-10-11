import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/screens/details_screen.dart';

class TodaysConferences extends StatefulWidget {
  TodaysConferences({super.key});

  @override
  State<TodaysConferences> createState() => _TodaysConferencesState();
}

class _TodaysConferencesState extends State<TodaysConferences> {
  @override
  Widget build(BuildContext context) {
    final List<BookingData> finalBookings = isSearched == false
        ? listOfBookings
        : listOfFoundBookingsFromAllMeetings;
    print('${isSearched} searched searched');
    print('${finalBookings} final final final it is');
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
            height: screenHeight * 0.33,
            child: ListView.builder(
                padding: const EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemCount: finalBookings.length,
                itemBuilder: (context, index) {
                  final bookingData = finalBookings[index];
                  final conferenceHallName = bookingData.conferenceName != null
                      ? getConferenceHallName(bookingData.conferenceName!)
                      : 'Unknown Conference Hall';

                  final locationName = bookingData.locationName != null
                      ? getLocationName(bookingData.locationName!)
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
                        width: screenWidth * 0.46,
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02,
                                  horizontal: screenWidth * 0.01,
                                ),
                                child: Image.asset(
                                  "assets/images/meeting-room5.png",
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
                                              currentLocationName:
                                                  locationName)));
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
                                  fontSize: 13,
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
                                      '${bookingData.meetingTitle}',
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons
                                        .av_timer, // Replace with the icon you want
                                    color: Color(
                                        0xFF696767), // Set the color of the icon
                                    size: 24, // Set the size of the icon
                                  ),
                                  // SizedBox(
                                  //     width:
                                  //         8), // Add some spacing between the icon and text
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 0,
                                          ),
                                          child: Text(
                                            '${bookingData.bookingDate} | ${bookingData.strTime} to ${bookingData.endTime}',
                                            style: TextStyle(
                                              color: Color(0xFF696767),
                                              fontSize: 12,
                                              fontFamily: 'Noto Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )))
                                ],
                              )
                            ]),
                      ));
                }))
        : const Center(
            child: Text(
              'No results found',
              style: TextStyle(fontSize: 24),
            ),
          );
  }
}
