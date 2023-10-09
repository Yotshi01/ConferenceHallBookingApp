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

  for (final location in listOfLocations) {
    if (location.locationName == locationId) {
      return location.locationName!;
    }
  }
  return 'Unknown Location';
}
