import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conference_hall_booking/models/events.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/source/constants.dart';

Future<BookingDetails> getBookingDetails() async {
  String url = testUrl + "booking_details";
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
  String url = testUrl + "booking_details"; // Replace with your server URL
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

Future<UpdateBooking> updateBooking(BookingData value) async {
  String url = testUrl + "update_booking";
  Uri urlUri = Uri.parse(url);
  var requestBody = {
    "booking_id": toBeUpdatedBookingData.bookingId.toString(),
    "meeting_title": toBeUpdatedBookingData.meetingTitle,
    "location_id": toBeUpdatedBookingData.locationName.toString(),
    "conference_id": toBeUpdatedBookingData.conferenceName.toString(),
    "meeting_description": toBeUpdatedBookingData.meetingDes,
    "other_details": toBeUpdatedBookingData.otherDetails,
    "booking_date": toBeUpdatedBookingData.bookingDate,
    "start_time": toBeUpdatedBookingData.strTime,
    "end_time": toBeUpdatedBookingData.endTime,
    "updated_at": toBeUpdatedBookingData.updatedAt,
  };
  // print(toBeUpdatedBookingData.bookingId);
  // print(toBeUpdatedBookingData.meetingTitle);
  // print(toBeUpdatedBookingData.locationName);
  // print(toBeUpdatedBookingData.conferenceName);
  // print(toBeUpdatedBookingData.meetingDes);
  // print(toBeUpdatedBookingData.otherDetails);
  // print(toBeUpdatedBookingData.strTime);
  // print(toBeUpdatedBookingData.endTime);
  var response = await http.post(urlUri,
      // headers: {"Content-Type": "application/json"},
      body: requestBody);
  print(response.body);
  if (response.statusCode == 200) {
    // Assuming the server returns the updated booking details in the response
    return UpdateBooking.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update booking details');
  }
}
