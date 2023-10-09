import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/conference_hall_details.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';

Future<ConferenceHallDetails> getConferenceHallDetails() async {
  String url = testUrl + "conference_list";
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(urlUri);
  print(response.body);
  // if (response

  return ConferenceHallDetails.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}
