import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<BlackoutDaysDetails> getBlackoutDaysDetails() async {
  String url = testUrl + "blackout_days";
  Uri urlUri = Uri.parse(url);
  final response = await http.get(urlUri);
  print(response.body);

  return BlackoutDaysDetails.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}
