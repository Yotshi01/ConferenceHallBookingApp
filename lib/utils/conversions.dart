import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:intl/intl.dart';

String convertStringDateIntoDesiredFormat(String dateString) {
  DateTime dateDateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat('dd-MM-yyyy', 'en_US').format(dateDateTime);
  return formattedDate;
}

String convertStringTimeIntoDesiredFormat(String timeString) {
  // merging time with a random date so that the provided timeString
  // can be used in DateTime.parse() for conversion
  DateTime timeDateTime = DateTime.parse('1970-01-01 ${timeString}');
  String formattedTime = DateFormat('h:mm a', 'en_US').format(timeDateTime);
  return formattedTime;
}

String convertDateTimeTimeIntoDesiredFormat(DateTime timeDateTime) {
  String formattedTime = DateFormat('h:mm a', 'en_US').format(timeDateTime);
  return formattedTime;
}

String convertDateTimeDateIntoDesiredFormat(DateTime dateDateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy', 'en_US').format(dateDateTime);
  return formattedDate;
}

String convertTimeOfDayTimeIntoDesiredFormat(TimeOfDay timeTimeOfDay) {
  // Format the TimeOfDay object
  String formattedTime = DateFormat('h:mm a')
      .format(DateTime(2023, 1, 1, timeTimeOfDay.hour, timeTimeOfDay.minute));

  return formattedTime;
}

int hourPartOfStringTime(String timeString) {
  DateTime timeDateTime = DateTime.parse('1970-01-01 ${timeString}');
  int hour = timeDateTime.hour;
  return hour;
}

int minutePartOfStringTime(String timeString) {
  DateTime timeDateTime = DateTime.parse('1970-01-01 ${timeString}');
  int minute = timeDateTime.minute;
  return minute;
}

DateTime combineStringDateAndTimeIntoDateTimeFormat(
    String dateString, String timeString) {
  DateTime timeDateTime = DateTime.parse('$dateString ${timeString}');

  return timeDateTime;
}

// Helper function to truncate the meeting title
String truncateMeetingTitle(String title) {
  const int maxCharacters = 50;
  if (title.length <= maxCharacters) {
    return title;
  } else {
    return '${title.substring(0, maxCharacters)}...';
  }
}

DateTime roundToNext30Or60Minutes(DateTime dateTime) {
  final minutes = dateTime.minute;
  final roundedMinutes = (minutes > 30) ? 00 : 30;
  final newHour = (minutes > 30) ? dateTime.hour + 1 : dateTime.hour;
  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    newHour,
    roundedMinutes,
  );
}
