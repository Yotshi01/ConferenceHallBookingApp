import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<ForgotPasswordResponse> sendRequest(String email) async {
  String url = testUrl + "forgot_password";
  Uri urlUri = Uri.parse(url);

  var requestBody = {'email': email};
  final response = await http.post(urlUri, body: requestBody);
  print('asnasxnas');
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    print('success');
    print(response.body);

    return ForgotPasswordResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to send mail to reset password');
  }
}
