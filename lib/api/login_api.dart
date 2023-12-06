import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> userLogin(String email, String password) async {
  String url = "${testUrl}login";
  Uri urlUri = Uri.parse(url);
  // print(email);
  // print(password);
  var requestBody = {
    'email': email,
    'password': password,
  };
  final response = await http.post(urlUri, body: requestBody);
  // print('asnasxnas');
  // print(response.statusCode);
  // print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    // print('success');
    // print(response.body);

    return LoginModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<FirebaseTokenResponse> addFirebaseToken(CurrentUserData value) async {
  String url = "${testUrl}firebase_token";
  Uri urlUri = Uri.parse(url);
  var requestBody = {
    "user_id": value.id.toString(),
    "firebase_token": value.firebaseToken,
    // "user_contact_number": toBeEditedProfileData.userContactNumber,
  };

  // print('000000000000000000000000000000000000000000000000000000000000000000');
  // print(value.id.toString());
  // print(value.firebaseToken);

  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  // print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return FirebaseTokenResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to add firebase token');
  }
}
