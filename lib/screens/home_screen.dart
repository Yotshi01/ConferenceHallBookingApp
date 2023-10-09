import 'package:conference_hall_booking/api/location_details_api.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/screens/notifications_screen.dart';
import 'package:conference_hall_booking/utils/old_meetings.dart';
import 'package:conference_hall_booking/utils/todays_conferences.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/navigation_drawer.dart';
import 'package:conference_hall_booking/reusables/search_bar.dart';
import 'package:conference_hall_booking/reusables/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _fetchBookingDetails() async {
    try {
      // bookingDetailsResponse = getBookingDetails();
      final BookingDetails data = await bookingDetailsResponse;
      setState(() {
        if (data.data != null) {
          listOfBookings = data.data!.map((item) {
            return BookingData.fromJson(item.toJson());
          }).toList();
          print(listOfBookings);
        }
      });
    } catch (error) {
      print('Error fetching booking list data: $error');
    }
  }

  Future<void> _fetchConferenceHallDetails() async {
    try {
      // bookingDetailsResponse = getBookingDetails();
      final ConferenceHallDetails data = await conferenceHallDetailsResponse;
      setState(() {
        if (data.data != null) {
          listOfConferenceHall = data.data!.map((item) {
            return ConferenceHallData.fromJson(item.toJson());
          }).toList();
          print(listOfConferenceHall);
        }
      });
    } catch (error) {
      print('Error fetching conference hall list data: $error');
    }
  }

  Future<void> _fetchLocationDetails() async {
    try {
      // bookingDetailsResponse = getBookingDetails();
      final LocationDetails data = await locationDetailsResponse;
      setState(() {
        if (data.data != null) {
          listOfLocations = data.data!.map((item) {
            return LocationData.fromJson(item.toJson());
          }).toList();
          print(listOfLocations);
        }
      });
    } catch (error) {
      print('Error fetching location list data: $error');
    }
  }

  @override
  void initState() {
    bookingDetailsResponse = getBookingDetails();
    conferenceHallDetailsResponse = getConferenceHallDetails();
    locationDetailsResponse = getLocationDetails();
    _fetchBookingDetails();
    _fetchConferenceHallDetails();
    _fetchLocationDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawerFile(),
        appBar: AppBar(
          elevation: 1,
          flexibleSpace: Container(),
          centerTitle: true,
          title: const Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.25,
              letterSpacing: 0.16,
            ),
          ),
          // backgroundColor: const Color(0xFF048B3F),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsScreen()));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.21, -0.98),
                end: Alignment(-0.21, 0.98),
                colors: [Colors.white, Color(0x00DBCC95)],
              ),
            ),
            // width: screenWidth,
            // height: screenHeight,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),

                bookNow(context),

                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    // vertical: constraints.maxWidth * 0.00,
                    horizontal: screenWidth * 0.03,
                  ),
                  child: reusableSearchBar(),
                ),
                // SizedBox(
                //   height: screenHeight * 0.01,
                //   child: Text(
                //     'Today’s Meeting',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Color(0xFF615E5E),
                //       fontSize: 16,
                //       fontFamily: 'Noto Sans',
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Today’s Meeting',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF615E5E),
                        fontSize: 16,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFFC2C0C0), // Set the color of the divider line
                  thickness: 1, // Set the thickness of the divider line
                ),
                // SizedBox(
                //   height: screenHeight * 0.03,
                // ),
                TodaysConferences(),
                // SizedBox(
                //   height: screenHeight * 0.01,
                //   child: Text(
                //     'My Meetings',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Color(0xFF615E5E),
                //       fontSize: 16,
                //       fontFamily: 'Noto Sans',
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    // vertical: screenHeight * 0.03
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Meeting',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF615E5E),
                        fontSize: 16,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFFC2C0C0), // Set the color of the divider line
                  thickness: 1, // Set the thickness of the divider line
                ),
                TodaysConferences(),

                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    // vertical: screenHeight * 0.03
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Next Meeting',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF615E5E),
                        fontSize: 16,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFFC2C0C0), // Set the color of the divider line
                  thickness: 1, // Set the thickness of the divider line
                ),
                TodaysConferences(),

                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    // vertical: screenHeight * 0.03
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Old Meeting',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF615E5E),
                        fontSize: 16,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xFFC2C0C0), // Set the color of the divider line
                  thickness: 1, // Set the thickness of the divider line
                ),
                OldMeetings(),
              ],
            ),
          ),
        ));
  }
}
