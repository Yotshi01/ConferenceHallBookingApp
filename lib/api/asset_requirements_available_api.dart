import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<AssetRequirementsAvailableDetails>
    getAssetRequirementsAvailable() async {
  try {
    String url = testUrl + "asset_requirements_available";
    Uri urlUri = Uri.parse(url);
    final response = await http.get(urlUri);

    if (response.statusCode == 200) {
      return AssetRequirementsAvailableDetails.fromJson(
          json.decode(response.body));
    } else {
      print('Error: ${response.statusCode}');
      print('Body: ${response.body}');
      throw Exception('Failed to load asset requirements available data');
    }
  } catch (e) {
    print('Exception: $e');
    throw Exception('Failed to load asset requirements available data');
  }
}
