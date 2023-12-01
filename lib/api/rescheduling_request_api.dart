import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<ReschedulingRequestDetails> addReschedulingRequest(
    ReschedulingRequestData value) async {
  String url = testUrl + "rescheduling_request";
  Uri urlUri = Uri.parse(url);

  var requestBody = {
    "request_id": toBeAddedReschedulingRequestData?.requestId.toString() ?? '',
    "request_booking_id":
        toBeAddedReschedulingRequestData?.requestBookingId.toString() ?? '',
    "request_booking_user_id":
        toBeAddedReschedulingRequestData?.requestBookingUserId.toString() ?? '',
    "request_requester_id":
        toBeAddedReschedulingRequestData?.requestRequesterId.toString() ?? '',
    "request_reason":
        toBeAddedReschedulingRequestData?.requestReason?.toString() ?? '',
    "request_status": toBeAddedReschedulingRequestData?.requestStatus ?? '',
  };

  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return ReschedulingRequestDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to request');
  }
}
