import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  late Future<void> _initialization;

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
      // print('Error fetching conference hall list data: $error');
      throw Exception('Error fetching conference hall list data: $error');
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
      // print('Error fetching location list data: $error');
      throw Exception('Error fetching location list data: $error');
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
      // var obtainedToken = '10|YCH2NW85mYQr70gedkIohzYyL0mkz2Tly8p8EcDG7cfb166a';
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

        // listOfMyMeetings = myMeetings();
        // listOfTodayMeetings = todayMeetings();
        // listOfMyOldMeetings = myOldMeetings();
        // listOfOtherMeetings = otherMeetings();
      });
    } catch (error) {
      // print('Error fetching user data: $error');
      throw Exception('Error fetching user data: $error');
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
      // print('Error fetching department list data: $error');
      throw Exception('Error fetching department list data: $error');
    }
  }

  Future<void> _fetchBookingDetails() async {
    try {
      final BookingDetails data = await bookingDetailsResponse;
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
    } catch (error) {
      // print('Error fetching booking list data: $error');
      throw Exception('Error fetching department list data: $error');
    }
  }

  @override
  void initState() {
    // Initialize the Future that combines all API calls
    _initialization = _initializeData();
    super.initState();
  }

  // // Function that combines all API calls
  // Future<void> _initializeData() async {
  //   await _fetchCurrentUserDetails();
  //   await getBookingDetails();
  //   await getConferenceHallDetails();
  //   await getLocationDetails();
  //   await getDepartmentDetails();
  //   await _fetchBookingDetails();
  //   await _fetchConferenceHallDetails();
  //   await _fetchLocationDetails();
  //   await _fetchDepartmentDetails();
  //   await myMeetings();
  //   await todayMeetings();
  //   await myOldMeetings();
  //   await otherMeetings();
  // }

  Future<void> _initializeData() async {
    try {
      await _fetchCurrentUserDetails();
      bookingDetailsResponse = getBookingDetails();
      conferenceHallDetailsResponse = getConferenceHallDetails();
      locationDetailsResponse = getLocationDetails();
      departmentDetailsResponse = getDepartmentDetails();
      await _fetchBookingDetails();
      await _fetchConferenceHallDetails();
      await _fetchLocationDetails();
      await _fetchDepartmentDetails();

      // Perform specific actions after API calls here
      await getBookingDetails();
      await getConferenceHallDetails();
      await getLocationDetails();
      await getDepartmentDetails();

      // Wait for these specific asynchronous functions
      myMeetings();
      todayMeetings();
      myOldMeetings();
      otherMeetings();

      // After all the above work is done, navigate to the TabbarSetup screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BlocProvider<BottomNavBarCubit>(
            create: (_) => BottomNavBarCubit(),
            child: const TabbarSetup(),
          ),
        ),
      );
    } catch (error) {
      print('Error initializing data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildContent(); // Your main content when initialization is complete
          } else if (snapshot.hasError) {
            return _buildError(snapshot.error.toString()); // Error UI
          } else {
            return _buildLoading(); // Loading UI
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    return Container(); // Replace this with your actual content
  }

  Widget _buildError(String error) {
    return Center(
      child: Text('Error: $error'),
    );
  }

  Widget _buildLoading() {
    return Container(
      height: screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0,
                screenHeight * 0.2,
                screenWidth * 0,
                screenHeight * 0.08,
              ),
              child: Image.asset(
                "assets/images/booking.png",
                width: screenWidth * 0.7,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
