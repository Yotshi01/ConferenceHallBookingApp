import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart' as Constants;

Future<BookingDetails> getBookingDetails() async {
  String url = Constants.testUrl + "booking_details";
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(urlUri);
  print(response.body);
  // if (response

  return BookingDetails.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}

Future<BookingDetails> addBookingDetails(BookingDetails bookingDetails) async {
  String url =
      Constants.testUrl + "booking_details"; // Replace with your server URL
  Uri urlUri = Uri.parse(url);

  final response = await http.post(
    urlUri,
    headers: {"Content-Type": "application/json"},
    body: json.encode(
        bookingDetails.toJson()), // Convert BookingDetails object to JSON
  );

  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return BookingDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to add booking details');
  }
}
