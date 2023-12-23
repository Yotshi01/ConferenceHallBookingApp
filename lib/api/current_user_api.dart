import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<CurrentUserData> getCurrentUserData(String token) async {
  String url = "${testUrl}user";
  Uri urlUri = Uri.parse(url);

  try {
    final response = await http.get(
      urlUri,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      return CurrentUserData.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to load currently logged in user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching user data: $e');
  }
}
