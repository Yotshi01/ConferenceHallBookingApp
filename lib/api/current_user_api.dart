import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<CurrentUserData> getCurrentUserData(String token) async {
  String url = testUrl + "user";
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(
    urlUri,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    return CurrentUserData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load currently logged in user data');
  }
}
