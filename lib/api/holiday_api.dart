import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';

Future<HolidayDetails> getHolidayDetails() async {
  String url = testUrl + "holidays";
  Uri urlUri = Uri.parse(url);
  final response = await http.get(urlUri);
  print(response.body);

  return HolidayDetails.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}
