import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String enteredKeywordState =
    ""; // variable that stores the keyword searched in search bar

class _HomeScreenState extends State<HomeScreen> {
  // function that fetches api response for getting all booking details
  Future<void> _fetchBookingDetails() async {
    try {
      final BookingDetails data = await bookingDetailsResponse;
      setState(() {
        if (data.data != null) {
          // accessing the 'data'(in key value pair, 'data' is a key in api response
          // and has some value) of the api response and storing the value in global
          // variable listOfBookings(defined in constants.dart file) after convering
          // it in list format. .toList() function is used to convert the data in list
          // format.
          listOfBookings = data.data!.map((item) {
            return BookingData.fromJson(item.toJson());
          }).toList();
        }
      });
    } catch (error) {
      print('Error fetching booking list data: $error');
    }
  }

  // function that fetches api response for conference hall details
  Future<void> _fetchConferenceHallDetails() async {
    try {
      final ConferenceHallDetails data = await conferenceHallDetailsResponse;
      setState(() {
        if (data.data != null) {
          // accessing the 'data' of the api response and storing the value in global
          // variable listOfConferenceHall(defined in constants.dart file) after convering
          // it in list format. .toList() function is used to convert the data in list
          // format.
          listOfConferenceHall = data.data!.map((item) {
            return ConferenceHallData.fromJson(item.toJson());
          }).toList();
        }
      });
    } catch (error) {
      print('Error fetching conference hall list data: $error');
    }
  }

  // function that fetches api response for location details
  Future<void> _fetchLocationDetails() async {
    try {
      final LocationDetails data = await locationDetailsResponse;
      setState(() {
        if (data.data != null) {
          // accessing the 'data' of the api response and storing the value in global
          // variable listOfLocations(defined in constants.dart file) after convering
          // it in list format. .toList() function is used to convert the data in list
          // format.
          listOfLocations = data.data!.map((item) {
            return LocationData.fromJson(item.toJson());
          }).toList();
        }
      });
    } catch (error) {
      print('Error fetching location list data: $error');
    }
  }

  // function that fetches api response for current logged in user details
  Future<void> _fetchCurrentUserDetails() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // we have already stored current logged in user data in
      // sharedPreferences(in login_screen.dart when the user presses the login button).
      // Now we are using the stored token foruser to get his/her user data from the database
      var obtainedToken = sharedPreferences.getString('token');
      var userData = await getCurrentUserData(
          obtainedToken!); // calling getCurrentUserData() function to make an api request to get current uer data

      setState(() {
        currentUserData =
            userData; // putting the value of fetched current user data in global variable currentUserData(defined in constants.dart file, is of type CurrentUserData which is a class in current_user_model.dart file).

        // putting the current user data in a list
        listOfCurrentUserData = [currentUserData!];

        // calling specific utility functions to return data in list format
        // to be stored in their respective global list variables. Theis
        // purposes can be infered from their naming
        listOfMyMeetings = myMeetings();
        listOfTodayMeetings = todayMeetings();
        listOfMyOldMeetings = myOldMeetings();
        listOfOtherMeetings = otherMeetings();
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<void> _fetchDepartmentDetails() async {
    try {
      final DepartmentDetails data = await departmentDetailsResponse;
      setState(() {
        if (data.data != null) {
          // accessing the 'data' of the api response and storing the value in global
          // variable listOfConferenceHall(defined in constants.dart file) after convering
          // it in list format. .toList() function is used to convert the data in list
          // format.
          listOfDepartments = data.data!.map((item) {
            return DepartmentData.fromJson(item.toJson());
          }).toList();
        }
      });
    } catch (error) {
      print('Error fetching department list data: $error');
    }
  }

  // all the api calling functions are called here in this initState
  // function so that the process of fetching required data as response
  // is done at the very start of this file being executed so that all the
  // other works depending on the fetched data from api can be done after that
  @override
  void initState() {
    _fetchCurrentUserDetails();
    bookingDetailsResponse = getBookingDetails();
    conferenceHallDetailsResponse = getConferenceHallDetails();
    locationDetailsResponse = getLocationDetails();
    departmentDetailsResponse = getDepartmentDetails();
    _fetchBookingDetails();
    _fetchConferenceHallDetails();
    _fetchLocationDetails();
    _fetchDepartmentDetails();
    super.initState();
  }

  // function to search and then display filtered list view builder
  // cards(of all headings) according to the keyword entered in the
  // search bar by the user
  void _runFilter(String enteredKeyword) {
    // defining lists to store searched results and initializing them
    // with empty list for the time being
    List<BookingData> searchResultsForTodayMeetings = [];
    List<BookingData> searchResultsForOtherMeetings = [];
    List<BookingData> searchResultsForMyMeetings = [];
    List<BookingData> searchResultsForMyOldMeetings = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      searchResultsForTodayMeetings = [];
      searchResultsForOtherMeetings = [];
      searchResultsForMyMeetings = [];
      searchResultsForOtherMeetings = [];
      // here the use of isSearched variable is to find out whether the user
      // is trying to search something or not. If not then the isSearched
      // will be false and complete data lists will be shown to the user
      // otherwise isSearched will be set to true if the user tries to search
      // something and the _runFilter() function will filter the list according
      // to the entered keyword by the user
      setState(() {
        isSearched = false;
      });
    } else {
      setState(() {
        isSearched = true;
      });
      searchResultsForTodayMeetings = listOfTodayMeetings
          .where((item) =>
              getConferenceHallName(item?.bookingConferenceId)
                  ?.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ??
              false)
          .toList();

      searchResultsForOtherMeetings = listOfOtherMeetings
          .where((item) =>
              getConferenceHallName(item?.bookingConferenceId)
                  ?.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ??
              false)
          .toList();
      // we use the toLowerCase() method to make it case-insensitive

      searchResultsForMyMeetings = listOfMyMeetings
          .where((item) =>
              getConferenceHallName(item?.bookingConferenceId)
                  ?.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ??
              false)
          .toList();

      searchResultsForMyOldMeetings = listOfMyOldMeetings
          .where((item) => item.bookingMeetingTitle!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      print('${searchResultsForOtherMeetings} searhed searched searcheddddddd');
      print('${searchResultsForMyMeetings} searhed searched searcheddddddd');
      print(
          '${searchResultsForMyOldMeetings} searhed searched searcheddddddd ololololo');
    }

    setState(() {
      listOfFoundBookingFromTodayMeetings = searchResultsForTodayMeetings;
      listOfFoundBookingsFromOtherMeetings =
          searchResultsForOtherMeetings; // Update the state here to trigger a rebuild
      listOfFoundBookingsFromMyMeetings = searchResultsForMyMeetings;
      enteredKeywordState = enteredKeyword;
      listOfFoundBookingsFromMyOldMeetings = searchResultsForMyOldMeetings;
      // enteredKeywordState = enteredKeyword;
    });
    print(
        '${listOfFoundBookingsFromAllMeetings} list of found bookings ${enteredKeywordState}');
    print(
        '${listOfFoundBookingsFromMyMeetings} list of found bookings ${enteredKeywordState}');
    print(
        '${listOfFoundBookingsFromMyOldMeetings} list of found bookings ${enteredKeywordState}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  labelText: 'Search by Conference Room name',
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
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
                  'Today\'s Meetings (${convertDateTimeDateIntoDesiredFormat(DateTime.now())})',
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
                  'My Meetings',
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
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Other Meetings',
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
            OtherConferences(),
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
                  'Old Meetings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFB88D05),
                    //color: Color(0xFF615E5E),
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
            MyOldConferences(),
          ],
        ),
      ),
    ));
  }
}
