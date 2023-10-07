import 'package:conference_hall_booking/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart' as Constants;

Future<LoginModel> userLogin(String email, String password) async {
  String url = "http://10.0.7.159:8000/api/login";
  Uri urlUri = Uri.parse(url);
  print(email);
  print(password);
  var requestBody = {
    'email': email,
    'password': password,
  };
  final response = await http.post(urlUri, body: requestBody);
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    print('success');
    print(response.body);

    return LoginModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}
