import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> userLogin(String email, String password) async {
  String url = testUrl + "login";
  Uri urlUri = Uri.parse(url);
  print(email);
  print(password);
  var requestBody = {
    'email': email,
    'password': password,
  };
  final response = await http.post(urlUri, body: requestBody);
  print('asnasxnas');
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    print('success');
    print(response.body);

    return LoginModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}
