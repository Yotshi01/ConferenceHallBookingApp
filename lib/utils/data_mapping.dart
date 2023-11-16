import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

String getConferenceHallName(int? conferenceHallId) {
  // Find the conference hall data with the matching conferenceName

  for (final conferenceHall in listOfConferenceHall) {
    if (conferenceHall.conferenceId == conferenceHallId) {
      return conferenceHall.conferenceName!;
    }
  }
  return 'Unknown Conference Hall';
}

String getConferenceHallDescription(int conferenceHallId) {
  // Find the conference hall data with the matching conferenceName

  for (final conferenceHall in listOfConferenceHall) {
    if (conferenceHall.conferenceId == conferenceHallId) {
      return conferenceHall.conferenceAboutRoom!;
    }
  }
  return 'Unknown Conference Hall';
}

String getConferenceHallImageName(int conferenceHallId) {
  // Find the conference hall data with the matching conferenceName

  for (final conferenceHall in listOfConferenceHall) {
    if (conferenceHall.conferenceId == conferenceHallId) {
      return conferenceHall.conferenceImg!;
    }
  }
  return 'meeting-room5.png';
}

int getConferenceHallId(String conferenceHallName) {
  // Find the conference hall data with the matching conferenceName
  print('${listOfConferenceHall} dmldqkdqdqmdw');
  for (final conferenceHall in listOfConferenceHall) {
    print(conferenceHall.conferenceName);
    if (conferenceHall.conferenceName == conferenceHallName) {
      return conferenceHall.conferenceId!;
    }
  }
  return -1;
}

String getLocationName(int locationId) {
  // Find the conference hall data with the matching conferenceName
  print('${listOfLocations} dmldqkdqdqmdw');
  for (final location in listOfLocations) {
    print(location.locationName);
    if (location.locationId == locationId) {
      return location.locationName!;
    }
  }
  return 'Unknown Location';
}

int getLocationId(String locationName) {
  // Find the conference hall data with the matching conferenceName
  print('${listOfLocations} dmldqkdqdqmdw');
  for (final location in listOfLocations) {
    print(location.locationName);
    if (location.locationName == locationName) {
      return location.locationId!;
    }
  }
  return -1;
}

List<BookingData> myMeetings() {
  List<BookingData> myBookings = [];

  // Check if currentUserData is not null
  if (currentUserData != null) {
    DateTime now = DateTime.now();

    for (var booking in listOfBookings) {
      String? bookingDateStr = booking.bookingDate;
      DateTime? bookingDate = DateTime.tryParse(bookingDateStr!);

      // Check if bookingDate is not null
      if (bookingDate != null) {
        if (bookingDate.isAfter(now) ||
            (bookingDate.day == now.day &&
                bookingDate.month == now.month &&
                bookingDate.year == now.year)) {
          // Check if the booking is after today or occurs today
          if (currentUserData!.id == booking.userId) {
            myBookings.add(booking);
          }
        }
      }
    }
  } else {
    print('currentUserData is empty');
  }

  return myBookings;
}

List<BookingData> otherMeetings() {
  List<BookingData> otherBookings = [];
  if (currentUserData != null) {
    // Check if currentUserData is not null

    DateTime now = DateTime.now();

    for (var booking in listOfBookings) {
      String? bookingDateStr = booking.bookingDate;

      if (bookingDateStr != null) {
        DateTime? bookingDate = DateTime.tryParse(bookingDateStr);

        print('${currentUserData!.id} ${booking.userId}');
        if (currentUserData!.id != booking.userId &&
            now.isBefore(bookingDate!)) {
          // Use currentUserData without ! here
          otherBookings.add(booking);
          print(otherBookings);
        }
      } else {
        print('Booking date is null');
      }
    }
    print('${otherBookings} 1111111111111111 ${currentUserData!.id}');
  } else {
    print('currentUserData is empty');
  }
  return otherBookings;
}

List<BookingData> myOldMeetings() {
  List<BookingData> myOldBookings = [];

  // Check if currentUserData is not null
  if (currentUserData != null) {
    DateTime now = DateTime.now();

    for (var booking in listOfBookings) {
      String? bookingDateStr = booking.bookingDate;
      print('${bookingDateStr} dclkacam');

      // Check if bookingDateStr is not null
      if (bookingDateStr != null) {
        DateTime? bookingDate = DateTime.tryParse(bookingDateStr);

        print('${bookingDate} ${bookingDate!.isBefore(now)}cnjzxcklkczx');

        // Check if bookingDate is not null and if the booking is in the past
        if (bookingDate != null &&
            bookingDate.isBefore(now) &&
            bookingDate.day < now.day &&
            currentUserData!.id == booking.userId) {
          myOldBookings.add(booking);
          print('Added a booking to myOldBookings');
        } else {
          print(
              'Booking is not in the past or invalid date format: $bookingDateStr');
        }
      } else {
        print('Booking date is null');
      }
    }

    print('Old Bookings: $myOldBookings');
  } else {
    print('currentUserData is empty');
  }

  return myOldBookings;
}

List<BookingData> todayMeetings() {
  List<BookingData> todayBookings = [];
  if (currentUserData != null) {
    // Check if currentUserData is not null
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    for (var booking in listOfBookings) {
      // Convert booking.bookingDate from String to DateTime and then compare
      String? bookingDateStr = booking.bookingDate;

      if (bookingDateStr != null) {
        DateTime? bookingDate = DateTime.tryParse(bookingDateStr);

        if (bookingDate != null && bookingDate.isAtSameMomentAs(today)) {
          todayBookings.add(booking);
          print('Added a booking to todayBookings');
        } else {
          print('Booking is not today or invalid date format: $bookingDateStr');
        }
      } else {
        print('Booking date is null');
      }
    }

    print('Today Bookings: $todayBookings');
  } else {
    print('currentUserData is empty');
  }

  return todayBookings;
}

// BookingDetails filterByConferenceHall(int conference_hall_id) {
//   List<BookingData> calendarFilteringForConferenceHall = [];
//   for (final bookingDataForConferenceHall in listOfBookings) {
//     if (bookingDataForConferenceHall == conference_hall_id) {
//       calendarFilteringForConferenceHall.add(bookingDataForConferenceHall);
//     }
//   }
// }

List<BookingData> getBookingDataAccordingToSelectedLocation(
    String locationChoosed) {
  List<BookingData> filteredBookings = [];
  if (currentUserData != null) {
    int locationId = getLocationId(locationChoosed);
    for (var booking in listOfBookings) {
      if (booking.bookingLocationId == locationId) {
        filteredBookings.add(booking);
        print('${filteredBookings} dnjdasda');
        print('${booking.bookingLocationId}  hellolololololololololololo');
      }
    }
  } else {
    print('currentUserData is empty');
  }
  return filteredBookings;
}

List<BookingData> getBookingDataAccordingToSelectedLocationAndConferenceHall(
    String locationChoosed, String conferenceHallChoosed) {
  List<BookingData> filteredBookings = [];
  if (currentUserData != null) {
    int locationId = getLocationId(locationChoosed);
    int conferenceHallId = getConferenceHallId(conferenceHallChoosed);
    print('${locationId}, ${conferenceHallId} aadjnkasldasx');
    for (var booking in listOfBookings) {
      if (booking.bookingLocationId == locationId &&
          booking.bookingConferenceId == conferenceHallId) {
        filteredBookings.add(booking);
        print('${filteredBookings} dasdzxc');
        print(
            '${booking.bookingLocationId}  ${booking.bookingConferenceId} hellolololololololololololo');
        print(
            '${booking.bookingId} || ${booking.bookingLocationId} || ${booking.bookingConferenceId} || ${locationId} || ${conferenceHallId} dczckjzcjzckjx');
      }
    }
  } else {
    print('currentUserData is empty');
  }
  return filteredBookings;
}

List<ConferenceHallData> getConferenceHallDataAccordingToSelectedLocation(
    String locationChoosed) {
  List<ConferenceHallData> conferenceHalls = [];
  if (currentUserData != null) {
    int locationId = getLocationId(locationChoosed);
    print('${locationChoosed} ddcacc');
    print('${locationId} ddcacc');
    for (var conferenceHall in listOfConferenceHall) {
      print('${conferenceHall.conferenceLocationId} ${locationId} vdvdzvvdvzv');
      if (conferenceHall.conferenceLocationId == locationId) {
        conferenceHalls.add(conferenceHall);
      }
    }
  } else {
    print('currentUserData is empty');
  }
  print('${conferenceHalls} adfafcasdad');
  return conferenceHalls;
}

String formatTimeIn12HourClockFormat(TimeOfDay timeOfDay) {
  if (timeOfDay != null) {
    String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = timeOfDay.hourOfPeriod;
    int minute = timeOfDay.minute;

    // Format the time in 12-hour clock format with AM/PM marker
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  } else {
    // Handle the case where timeOfDay is null (provide a default value or error message)
    return 'Invalid Time';
  }
}

List<String> getDepartmentNames() {
  List<String> departmentNames = [];
  for (var department in listOfDepartments) {
    departmentNames.add(department.departmentName!);
  }
  return departmentNames;
}

int getDepartmentIdByName(String departmentName) {
  for (var department in listOfDepartments) {
    if (departmentName == department.departmentName) {
      return department.departmentId!;
    }
  }
  return 0;
}

String getDepartmentNameById(int departmentId) {
  for (var department in listOfDepartments) {
    if (departmentId == department.departmentId) {
      return department.departmentName!;
    }
  }
  return '';
}
