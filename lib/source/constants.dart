import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;
// const String testUrl = 'http://10.0.7.214:8000/api/';
const String testUrl = 'http://10.0.7.159:8000/api/';
// const String testUrl = 'http://10.0.7.116:8000/api/';
// const String testUrl = 'http://10.0.6.32:8000/api/';
// const String testUrl = 'http://192.168.1.7:8000/api/';
// const String testUrl = 'http://192.168.1.16:8000/api/';
// const String liveUrl = 'http://10.0.7.159:8000/api/';
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
List<BookingData> listOfFilteredMeetingsAccordingToDropdownSelections = [];
List<ConferenceHallData> conferenceHallsAtSelectedLocation = [];
CurrentUserData? currentUserData;
late Future<BookingDetails> bookingDetailsResponse;
late Future<ConferenceHallDetails> conferenceHallDetailsResponse;
late Future<DepartmentDetails> departmentDetailsResponse;
late Future<LocationDetails> locationDetailsResponse;
late Future<HolidayDetails> holidayDetailsResponse;

// late Future<CurrentUserData> currentUserDataResponse;
bool isSearched = false;
List<BookingData> listOfFoundBookingsFromAllMeetings = [];
List<BookingData> listOfFoundBookingsFromMyMeetings = [];
List<BookingData> listOfFoundBookingsFromMyOldMeetings = [];
List<BookingData> listOfFoundBookingFromTodayMeetings = [];
List<BookingData> listOfFoundBookingsFromOtherMeetings = [];
List<HolidayData> listOfHolidays = [];
BookingData toBeUpdatedBookingData = BookingData();
BookingData toBeAddedBookingData = BookingData();
CurrentUserData toBeEditedProfileData = CurrentUserData();
ReschedulingRequestData toBeAddedReschedulingRequestData =
    ReschedulingRequestData();
String? conferenceRoomChoosed;
String? currentUserNotificationFirebaseToken;
