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
  // print('${listOfConferenceHall} dmldqkdqdqmdw');
  for (final conferenceHall in listOfConferenceHall) {
    // print(conferenceHall.conferenceShortName);
    if (conferenceHall.conferenceName == conferenceHallName) {
      return conferenceHall.conferenceId!;
    }
  }
  return -1;
}

ConferenceHallData getConferenceHallDataByName(String name) {
  var conferenceHall = ConferenceHallData();
  for (conferenceHall in listOfConferenceHall) {
    if (name == conferenceHall.conferenceName) {
      return conferenceHall;
    }
  }
  return conferenceHall;
}

String getLocationName(int locationId) {
  // Find the conference hall data with the matching conferenceName
  // print('${listOfLocations} dmldqkdqdqmdw');
  for (final location in listOfLocations) {
    // print(location.locationName);
    if (location.locationId == locationId) {
      return location.locationName!;
    }
  }
  return 'Unknown Location';
}

int getLocationId(String locationName) {
  // Find the conference hall data with the matching conferenceName
  // print('${listOfLocations} dmldqkdqdqmdw');
  for (final location in listOfLocations) {
    // print(location.locationName);
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
    // Sort myBookings based on bookingDate in ascending order
    myBookings.sort((a, b) => DateTime.parse(a.bookingDate!)
        .compareTo(DateTime.parse(b.bookingDate!)));
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
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

        // print('${currentUserData!.id} ${booking.userId}');
        if ((currentUserData!.id != booking.userId &&
                bookingDate!.isAfter(now)) ||
            ((currentUserData!.id != booking.userId) &&
                (bookingDate!.day == now.day &&
                    bookingDate.month == now.month &&
                    bookingDate.year == now.year))) {
          // Use currentUserData without ! here
          otherBookings.add(booking);
          // print(otherBookings);
        }
      } else {
        // print('Booking date is null');
        throw Exception('Booking date is null');
      }
    }
    // print('${otherBookings} 1111111111111111 ${currentUserData!.id}');

    // Sort otherBookings based on bookingDate in ascending order
    otherBookings.sort((a, b) => DateTime.parse(a.bookingDate!)
        .compareTo(DateTime.parse(b.bookingDate!)));
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
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
      // print('${bookingDateStr} dclkacam');

      // Check if bookingDateStr is not null
      if (bookingDateStr != null) {
        DateTime? bookingDate = DateTime.tryParse(bookingDateStr);

        // print('${bookingDate} ${bookingDate!.isBefore(now)}cnjzxcklkczx');

        // Check if bookingDate is not null and if the booking is in the past
        if (bookingDate != null &&
            bookingDate.isBefore(now) &&
            bookingDate.day < now.day &&
            currentUserData!.id == booking.userId) {
          myOldBookings.add(booking);
          // print('Added a booking to myOldBookings');
        }
        // else {
        //   // print(
        //   //     'Booking is not in the past or invalid date format: $bookingDateStr');
        //   throw Exception(
        //       'Booking is not in the past or invalid date format: $bookingDateStr');
        // }
      } else {
        // print('Booking date is null');
        throw Exception('Booking date is null');
      }
    }

    // print('Old Bookings: $myOldBookings');
    // Sort myOldBookings based on bookingDate in descending order
    myOldBookings.sort((a, b) => DateTime.parse(b.bookingDate!)
        .compareTo(DateTime.parse(a.bookingDate!)));
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
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
          // print('Added a booking to todayBookings');
        }
        // else {
        //   // print('Booking is not today or invalid date format: $bookingDateStr');
        //   throw Exception(
        //       'Booking is not today or invalid date format: $bookingDateStr');
        // }
      } else {
        // print('Booking date is null');
        throw Exception('Booking date is null');
      }
    }

    // print('Today Bookings: $todayBookings');
    // Sort todayBookings based on userId, placing current user's bookings first
    todayBookings.sort((a, b) {
      // print(
      //     '${a.bookingId},,,,,,,${b.bookingId} ${a.userId} || ${b.userId} 1check');
      if (a.userId == currentUserData!.id && b.userId != currentUserData!.id) {
        // print('${a.userId} || ${b.userId} 2check');
        return -1; // a comes first
      } else if (b.userId == currentUserData!.id &&
          a.userId != currentUserData!.id) {
        // print('${a.userId} || ${b.userId} 3check');
        return 1; // b comes first
      } else {
        // print('${a.userId} || ${b.userId} 4check');
        return 0; // order remains unchanged
      }
    });
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
  }

  return todayBookings;
}

List<ReschedulingRequestResponseData> mySortedNotifications() {
  List<ReschedulingRequestResponseData> mySortedNotifications = [];

  // Check if currentUserData is not null
  if (currentUserData != null) {
    DateTime now = DateTime.now();

    for (var reschedulingRequest in listOfReschedulingRequestsResponse) {
      String? reschedulingRequestDateStr =
          reschedulingRequest.bookingRequestCreatedAt;

      if (reschedulingRequestDateStr != null) {
        DateTime? reschedulingRequestDate =
            DateTime.tryParse(reschedulingRequestDateStr);

        // if (reschedulingRequestDate != null &&
        //     bookingDate.isBefore(now) &&
        //     bookingDate.day < now.day &&
        //     currentUserData!.id == booking.userId) {
        //   myOldBookings.add(booking);

        // }

        mySortedNotifications.add(reschedulingRequest);
      } else {
        // print('Booking date is null');
        throw Exception('Rescheduling Request date is null');
      }
    }

    // print('Old Bookings: $myOldBookings');
    // Sort myOldBookings based on bookingDate in descending order
    mySortedNotifications.sort((a, b) =>
        DateTime.parse(b.bookingRequestCreatedAt!)
            .compareTo(DateTime.parse(a.bookingRequestCreatedAt!)));
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
  }

  return mySortedNotifications;
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
        // print('${filteredBookings} dnjdasda');
        // print('${booking.bookingLocationId}  hellolololololololololololo');
      }
    }
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
  }
  return filteredBookings;
}

List<BookingData> getBookingDataAccordingToSelectedLocationAndConferenceHall(
    String locationChoosed, String conferenceHallChoosed) {
  List<BookingData> filteredBookings = [];
  if (currentUserData != null) {
    int locationId = getLocationId(locationChoosed);
    int conferenceHallId = getConferenceHallId(conferenceHallChoosed);
    // print('${locationId}, ${conferenceHallId} aadjnkasldasx');
    for (var booking in listOfBookings) {
      if (booking.bookingLocationId == locationId &&
          booking.bookingConferenceId == conferenceHallId) {
        filteredBookings.add(booking);
        // print('${filteredBookings} dasdzxc');
        // print(
        //     '${booking.bookingLocationId}  ${booking.bookingConferenceId} hellolololololololololololo');
        // print(
        //     '${booking.bookingId} || ${booking.bookingLocationId} || ${booking.bookingConferenceId} || ${locationId} || ${conferenceHallId} dczckjzcjzckjx');
      }
    }
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
  }
  return filteredBookings;
}

List<ConferenceHallData> getConferenceHallDataAccordingToSelectedLocation(
    String locationChoosed) {
  List<ConferenceHallData> conferenceHalls = [];
  if (currentUserData != null) {
    int locationId = getLocationId(locationChoosed);
    // print('${locationChoosed} ddcacc');
    // print('${locationId} ddcacc');
    for (var conferenceHall in listOfConferenceHall) {
      // print('${conferenceHall.conferenceLocationId} ${locationId} vdvdzvvdvzv');
      if (conferenceHall.conferenceLocationId == locationId) {
        conferenceHalls.add(conferenceHall);
      }
    }
  } else {
    // print('currentUserData is empty');
    throw Exception('currentUserData is empty');
  }
  // print('${conferenceHalls} adfafcasdad');
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

List<String> getDepartmentNames(int locationId) {
  List<String> departmentNames = [];
  List<DepartmentData> listOfDepartmentsAccordingToSelectedLocation = [];
  for (var departmentAccordingToSelectedLocation in listOfDepartments) {
    if (departmentAccordingToSelectedLocation.departmentLocationId ==
        locationId) {
      listOfDepartmentsAccordingToSelectedLocation
          .add(departmentAccordingToSelectedLocation);
    }
  }
  for (var department in listOfDepartmentsAccordingToSelectedLocation) {
    departmentNames.add(department.departmentName!);
  }
  return departmentNames;
}

List<String> getRefreshmentNames() {
  List<String> refreshmentNames = [];
  for (var refreshment in listOfRefreshmentsAvailable) {
    refreshmentNames.add(refreshment.refreshmentName!);
  }
  return refreshmentNames;
}

List<String> getStationaryNames() {
  List<String> stationaryNames = [];
  for (var stationary in listOfStationariesAvailable) {
    stationaryNames.add(stationary.stationaryName!);
  }
  return stationaryNames;
}

List<String> getAssetNames() {
  List<String> assetNames = [];
  for (var asset in listOfAssetRequirementsAvailable) {
    assetNames.add(asset.assetRequirementName!);
  }
  return assetNames;
}

int getDepartmentIdByName(String departmentName) {
  for (var department in listOfDepartments) {
    if (departmentName == department.departmentName) {
      return department.departmentId!;
    }
  }
  return 0;
}

int getRefreshmentIdByName(String refreshmentName) {
  for (var refreshment in listOfRefreshmentsAvailable) {
    if (refreshmentName == refreshment.refreshmentName) {
      return refreshment.refreshmentId!;
    }
  }
  return 0;
}

int getStationaryIdByName(String stationaryName) {
  for (var stationary in listOfStationariesAvailable) {
    if (stationaryName == stationary.stationaryName) {
      return stationary.stationaryId!;
    }
  }
  return 0;
}

int getAssetIdByName(String assetName) {
  for (var asset in listOfAssetRequirementsAvailable) {
    if (assetName == asset.assetRequirementName) {
      return asset.assetRequirementId!;
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

String getRefreshmentNameById(int refreshmentId) {
  for (var refreshment in listOfRefreshmentsAvailable) {
    if (refreshmentId == refreshment.refreshmentId) {
      return refreshment.refreshmentName!;
    }
  }
  return '';
}

String getStationaryNameById(int stationaryId) {
  for (var stationary in listOfStationariesAvailable) {
    if (stationaryId == stationary.stationaryId) {
      return stationary.stationaryName!;
    }
  }
  return '';
}

String getAssetNameById(int assetId) {
  for (var asset in listOfAssetRequirementsAvailable) {
    if (assetId == asset.assetRequirementId) {
      return asset.assetRequirementName!;
    }
  }
  return '';
}

String getUserNameById(int id) {
  for (var user in listOfUsers) {
    if (user.id == id) {
      return user.name!;
    }
  }
  return '';
}

BookingData getBookingByBookingId(int id) {
  BookingData foundBooking = BookingData();
  for (var booking in listOfBookings) {
    if (booking.bookingId == id) {
      foundBooking = booking;
    }
  }
  return foundBooking;
}

String getLocationShortNameByLocationId(int id) {
  for (var location in listOfLocations) {
    if (location.locationId == id) {
      return location.locationShortName!;
    }
  }
  return '';
}

String getConferenceHallShortNameByConferenceHallId(int id) {
  for (var conferenceHall in listOfConferenceHall) {
    if (conferenceHall.conferenceId == id) {
      return conferenceHall.conferenceShortName!;
    }
  }
  return '';
}

List<BlackoutDaysData> getBlackoutDayDataAccordingToLocationId(int id) {
  List<BlackoutDaysData> data = [];
  for (var blackOutDayData in listOfBlackoutDays) {
    if (blackOutDayData.blackoutDateLocationId == id) {
      data.add(blackOutDayData);
    }
  }
  return data;
}

List<BlackoutDaysData> getBlackoutDayDataAccordingToConferenceHallId(int id) {
  List<BlackoutDaysData> data = [];
  for (var blackOutDayData in listOfBlackoutDays) {
    if (blackOutDayData.blackoutDateConferenceId == id) {
      data.add(blackOutDayData);
    }
  }
  return data;
}

bool isRequestStatusOfCurrentUserOnThisBookingIdPending(int bookingId) {
  for (var request in listOfReschedulingRequestsResponse) {
    if (bookingId == request.requestBookingId &&
        currentUserData!.id == request.requestRequesterId &&
        request.requestStatus == 'Pending') {
      return true;
    }
  }
  return false;
}

String getUserImageNameById(int id) {
  for (var user in listOfUsers) {
    if (user.id == id) {
      return user.userImg != null ? user.userImg! : '';
    }
  }
  return '';
}

List<HolidayData> holidaysAccordingToLocation(int locationId) {
  List<HolidayData> holidaysAccordingToLocation = [];

  // Check if currentUserData is not null
  if (currentUserData != null) {
    for (var holidayLocation in listOfHolidayLocations) {
      if (holidayLocation.locationId == locationId) {
        for (var holiday in listOfHolidays) {
          if (holidayLocation.holidayId == holiday.holidayId) {
            holidaysAccordingToLocation.add(holiday);
          }
        }
      }
    }
  }

  return holidaysAccordingToLocation;
}
