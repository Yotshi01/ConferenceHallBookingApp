import 'package:conference_hall_booking/source/common_packages_export.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;
// const String testUrl = 'http://10.0.7.159:8000/api/';
const String testUrl = 'http://192.168.1.16:8000/api/';
const String liveUrl = 'http://10.0.7.159:8000/api/';
String? finalEmail;
String? finalToken;
List<BookingData> listOfBookings = [];
List<ConferenceHallData> listOfConferenceHall = [];
List<LocationData> listOfLocations = [];
late Future<BookingDetails> bookingDetailsResponse;
late Future<ConferenceHallDetails> conferenceHallDetailsResponse;
late Future<LocationDetails> locationDetailsResponse;
