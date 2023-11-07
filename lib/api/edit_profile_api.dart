import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<EditProfileData> editProfile(CurrentUserData value) async {
  String url = testUrl + "edit_profile";
  Uri urlUri = Uri.parse(url);
  var requestBody = {
    "user_id": toBeEditedProfileData.id.toString(),
    "user_name": toBeEditedProfileData.name,
    "contact_number": toBeEditedProfileData.userContactNumber,
  };

  print('000000000000000000000000000000000000000000000000000000000000000000');
  print(toBeEditedProfileData.id);
  print(toBeEditedProfileData.name);
  print(toBeEditedProfileData.userContactNumber);

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
