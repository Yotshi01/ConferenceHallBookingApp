import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<BookingDetails> getBookingDetails() async {
  String url = "http://10.0.7.159:8000/api/booking_details";
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
