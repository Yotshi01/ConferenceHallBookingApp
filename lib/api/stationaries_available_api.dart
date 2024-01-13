import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<StationariesAvailableDetails> getStationariesAvailableDetails() async {
  String url = "${liveUrl}stationaries_available";
  Uri urlUri = Uri.parse(url);
  final response = await http.get(urlUri);
  // print(response.body);
  return StationariesAvailableDetails.fromJson(json.decode(response.body));
}
