import 'package:conference_hall_booking/api/current_user_api.dart';
import 'package:conference_hall_booking/api/location_details_api.dart';
import 'package:conference_hall_booking/screens/login_screen.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/screens/notifications_screen.dart';
import 'package:conference_hall_booking/utils/old_meetings.dart';
import 'package:conference_hall_booking/utils/todays_conferences.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/navigation_drawer.dart';
import 'package:conference_hall_booking/reusables/reusable_widgets.dart';
import 'package:conference_hall_booking/utils/my_conferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String enteredKeywordState = "";

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

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

  Future<void> _fetchCurrentUserDetails() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var obtainedToken = sharedPreferences.getString('token');
      print(obtainedToken);
      var userData = await getCurrentUserData(obtainedToken!);

      setState(() {
        if (userData != null) {
          currentUserData = userData; // Set currentUserData here
          listOfCurrentUserData = [currentUserData!];
          print(listOfCurrentUserData.length);
          listOfMyMeetings = myMeetings();
          print('${listOfMyMeetings} 8888888888888888');
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  LoginScreen(), // Replace with your login page widget
            ),
          );
        }
      });
    } catch (error) {
      print('Error fetching user data: $error');
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
    _fetchCurrentUserDetails();

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    print('filter filter filter ${enteredKeyword}');
    List<BookingData> searchResultsForTodayMeetings = [];
    List<BookingData> searchResultsForMyMeetings = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      searchResultsForTodayMeetings = [];
      searchResultsForMyMeetings = [];
      setState(() {
        isSearched = false;
      });
    } else {
      setState(() {
        isSearched = true;
      });
      searchResultsForTodayMeetings = listOfBookings
          .where((item) => item.meetingTitle!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive

      searchResultsForMyMeetings = listOfMyMeetings
          .where((item) => item.meetingTitle!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      print('${searchResultsForTodayMeetings} searhed searched searcheddddddd');
      print('${searchResultsForMyMeetings} searhed searched searcheddddddd');
    }

    setState(() {
      listOfFoundBookingsFromAllMeetings =
          searchResultsForTodayMeetings; // Update the state here to trigger a rebuild
      listOfFoundBookingsFromMyMeetings = searchResultsForMyMeetings;
      enteredKeywordState = enteredKeyword;
    });
    print(
        '${listOfFoundBookingsFromAllMeetings} list of found bookings ${enteredKeywordState}');
    print(
        '${listOfFoundBookingsFromMyMeetings} list of found bookings ${enteredKeywordState}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawerFile(),
        drawerScrimColor: Colors.transparent,
        appBar: reusableAppBar('Home', context),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.21, -0.98),
                end: Alignment(-0.21, 0.98),
                colors: [Colors.white, Color.fromARGB(0, 216, 207, 173)],
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
                  child: TextField(
                    // controller: controller,
                    onChanged: (value) => _runFilter(value),
                    enableSuggestions: true,
                    autocorrect: true,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: Colors.black, size: screenWidth * 0.07),
                      labelText: 'Search here...',
                      labelStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.9)),
                      filled: true,
                      // suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.50,
                          // strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                      // hintText: text,
                    ),
                  ),
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
                MyConferences(),

                SizedBox(
                  height: screenHeight * 0.015,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: screenWidth * 0.03,
                //     // vertical: screenHeight * 0.03
                //   ),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       'Next Meeting',
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //         color: Color(0xFF615E5E),
                //         fontSize: 16,
                //         fontFamily: 'Noto Sans',
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                // Divider(
                //   indent: 10,
                //   endIndent: 10,
                //   color: Color(0xFFC2C0C0), // Set the color of the divider line
                //   thickness: 1, // Set the thickness of the divider line
                // ),
                // TodaysConferences(),

                // SizedBox(
                //   height: screenHeight * 0.015,
                // ),
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
