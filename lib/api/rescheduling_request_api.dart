import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:http/http.dart' as http;

Future<ReschedulingRequestDetails> addReschedulingRequest(
    ReschedulingRequestData value) async {
  String url = "${liveUrl}rescheduling_request";
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
    "booking_request_created_at":
        toBeAddedReschedulingRequestData?.bookingRequestCreatedAt ?? '',
  };

  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  // print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return ReschedulingRequestDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to request');
  }
}

Future<ReschedulingRequestResponse> getReschedulingRequestsByCurrentUserId(
    int currentUserId) async {
  String url =
      "${liveUrl}get_reschedule_request_by_current_user_id/${currentUserId}";
  // print('${url} nknjjxczx');
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(urlUri);
  // print("${response.body} nksdkjad");
  // if (response

  return ReschedulingRequestResponse.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}

Future<RequestResponseResponse> responseToReschedulingRequest(
    int id, String status) async {
  String url = "${liveUrl}response_to_rescheduling_request";
  Uri urlUri = Uri.parse(url);
  var requestBody = {
    "request_id": id.toString(),
    "request_status": status,
  };

  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  // print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return RequestResponseResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(
        'Failed to make a response to rescheduling request details');
  }
}
