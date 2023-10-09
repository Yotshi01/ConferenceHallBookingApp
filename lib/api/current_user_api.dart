import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';

Future<CurrentUserData> getCurrentUserData(String token) async {
  String url = testUrl + "user";
  Uri urlUri = Uri.parse(url);
  // Map<String, String> requestBody = {
  //   'mobile1': mobile,
  //   'password': password,
  // };
  final response = await http.get(
    urlUri,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  print(response.body);
  // if (response

  return CurrentUserData.fromJson(json.decode(response.body));
  // } else {
  //   throw Exception('Failed to load Data');
  // }
}
