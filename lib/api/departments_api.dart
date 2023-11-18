import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<DepartmentDetails> getDepartmentDetails() async {
  String url = testUrl + "departments";
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(urlUri);
  print(response.body);
  // if (response

  return DepartmentDetails.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}