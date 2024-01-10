import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;

//const String testUrl = 'http://10.0.7.214:8000/api/';
// const String testUrl = 'http://10.0.7.159:8000/api/';
// const String testUrl = 'http://10.0.7.116:8000/api/';
// const String testUrl = 'http://10.0.5.195:8000/api/';
// const String testUrl = 'http://10.0.6.32:8000/api/';
// const String testUrl = 'http://192.168.29.211:8000/api/';
// const String testUrl = 'http://192.168.1.16:8000/api/';
const String liveUrl = 'https://baithak.vnrseeds.in/api/';
// const String testUrl = 'http://192.168.1.7:8000/api/';

//const String testBaseUrl = 'http://10.0.7.214:8000';
// const String testBaseUrl = 'http://10.0.7.159:8000';
// const String testBaseUrl = 'http://10.0.7.116:8000';
// const String testBaseUrl = 'http://10.0.5.195:8000';
// const String testBaseUrl = 'http://10.0.6.32:8000';
// const String testBaseUrl = 'http://192.168.29.211:8000';
// const String testBaseUrl = 'http://192.168.1.16:8000';
const String liveBaseUrl = 'https://baithak.vnrseeds.in';
// const String testBaseUrl = 'http://192.168.1.7:8000';

String? finalEmail;
String? finalToken;
List<BookingData> listOfBookings = [];
List<ConferenceHallData> listOfConferenceHall = [];
List<LocationData> listOfLocations = [];
List<DepartmentData> listOfDepartments = [];
List<CurrentUserData> listOfCurrentUserData = [];
List<BookingData> listOfMyMeetings = [];
List<BookingData> listOfMyOldMeetings = [];
List<BookingData> listOfTodayMeetings = [];
List<BookingData> listOfOtherMeetings = [];
List<AssetRequirementsAvailableData> listOfAssetRequirementsAvailable = [];
List<RefreshmentsAvailableData> listOfRefreshmentsAvailable = [];
List<BookingData>
    listOfFilteredMeetingsAccordingToDropdownSelectionsForAddBooking = [];
List<BlackoutDaysData>
    listOfblackoutDaysDataAccordingToSelectedLocationForAddBooking = [];
List<BookingData>
    listOfFilteredMeetingsAccordingToDropdownSelectionsForEditBooking = [];

List<ConferenceHallData> conferenceHallsAtSelectedLocation = [];
CurrentUserData? currentUserData;
late Future<BookingDetails> bookingDetailsResponse;
late Future<ConferenceHallDetails> conferenceHallDetailsResponse;
late Future<DepartmentDetails> departmentDetailsResponse;
late Future<LocationDetails> locationDetailsResponse;
late Future<HolidayDetails> holidayDetailsResponse;
late Future<BlackoutDaysDetails> blackoutDaysDetailsResponse;
late Future<AssetRequirementsAvailableDetails>
    assetRequirementsAvailableDetailsResponse;
late Future<RefreshmentsAvailableDetails> refreshmentsAvailableDetailsResponse;
late Future<ReschedulingRequestResponse> reschedulingRequestResponse;
late Future<UsersApiResponse> usersApiResponse;

// late Future<CurrentUserData> currentUserDataResponse;
bool isSearched = false;
List<BookingData> listOfFoundBookingsFromAllMeetings = [];
List<BookingData> listOfFoundBookingsFromMyMeetings = [];
List<BookingData> listOfFoundBookingsFromMyOldMeetings = [];
List<BookingData> listOfFoundBookingFromTodayMeetings = [];
List<BookingData> listOfFoundBookingsFromOtherMeetings = [];
List<HolidayData> listOfHolidays = [];
List<BlackoutDaysData> listOfBlackoutDays = [];
List<ReschedulingRequestResponseData> listOfReschedulingRequestsResponse = [];
List<UsersData> listOfUsers = [];
BookingData toBeUpdatedBookingData = BookingData();
BookingData toBeAddedBookingData = BookingData();
CurrentUserData toBeEditedProfileData = CurrentUserData();
ReschedulingRequestData toBeAddedReschedulingRequestData =
    ReschedulingRequestData();
String? locationChoosed;
String? conferenceRoomChoosed;
String? currentUserNotificationFirebaseToken;

final Map<BottomNavBarItem, GlobalKey<NavigatorState>> navigatorKeys = {
  BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
  BottomNavBarItem.home: GlobalKey<NavigatorState>(),
  BottomNavBarItem.booking: GlobalKey<NavigatorState>(),
};

bool isRefreshNeeded = false;

final GlobalKey<HomeScreenState> homeScreenKey = GlobalKey();
final GlobalKey<SyncfusionCalendarState> syncfusionCalendarKey = GlobalKey();
final GlobalKey<TabbarSetupState> tabbarSetupKey = GlobalKey();

// String appBarTitle = 'Welcome';
