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
  if (currentUserData != null) {
    // Check if currentUserData is not null
    for (var booking in listOfBookings) {
      print('${currentUserData!.id} ${booking.userId}');
      if (currentUserData!.id == booking.userId) {
        // Use currentUserData without ! here
        myBookings.add(booking);
        print(myBookings);
      }
    }
    print('${myBookings} 1111111111111111 ${currentUserData!.id}');
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
  if (currentUserData != null) {
    // Check if currentUserData is not null
    DateTime now = DateTime.now();

    for (var booking in listOfMyMeetings) {
      // Convert booking.bookingDate from String to DateTime and then compare
      String? bookingDateStr = booking.bookingDate;

      if (bookingDateStr != null) {
        DateTime? bookingDate = DateTime.tryParse(bookingDateStr);

        if (bookingDate != null &&
            now.isAfter(bookingDate) &&
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
    for (var booking in listOfBookings) {
      if (booking.bookingLocationId == locationId &&
          booking.bookingConferenceId == conferenceHallId) {
        filteredBookings.add(booking);
        print(
            '${booking.bookingLocationId}  ${booking.bookingConferenceId} hellolololololololololololo');
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
