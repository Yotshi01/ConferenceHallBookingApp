import 'package:conference_hall_booking/models/edit_profile_model.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';

Future<EditProfileData> editProfile(CurrentUserData value) async {
  String url = testUrl + "edit_profile";
  Uri urlUri = Uri.parse(url);
  var requestBody = {
    "user_id": toBeEditedProfileData.id.toString(),
    "user_name": toBeEditedProfileData.name,
    "contact_number": toBeEditedProfileData.contactNumber,
  };

  print('000000000000000000000000000000000000000000000000000000000000000000');
  print(toBeEditedProfileData.id);
  print(toBeEditedProfileData.name);
  print(toBeEditedProfileData.contactNumber);

  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return EditProfileData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to edit profile details');
  }
}
