import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';

String getConferenceHallName(int conferenceHallId) {
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
      return conferenceHall.aboutRoom!;
    }
  }
  return 'Unknown Conference Hall';
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

List<BookingData> myOldMeetings() {
  List<BookingData> myOldBookings = [];
  if (currentUserData != null) {
    // Check if currentUserData is not null
    for (var booking in listOfMyMeetings) {
      // print('${currentUserData!.id} ${booking.userId}');
      if (DateTime.now().isAfter(booking.bookingDate as DateTime) ){
        // Use currentUserData without ! here
        myOldBookings.add(booking);
        print(myOldBookings);
        print('${myOldBookings} how old are you!!!!!!!!!!!!!!!!');
      }
      else{
        print('found the error error error');
      }
    }
    print('${myOldBookings} 1111111111111111 ${currentUserData!.id}');
  } else {
    print('currentUserData is empty');
  }
  return myOldBookings;
}
