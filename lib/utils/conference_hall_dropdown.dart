import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/api/conference_hall_details_api.dart';
import 'package:conference_hall_booking/models/conference_hall_details.dart';
import 'package:conference_hall_booking/screens/syncfusion_calendar.dart';

class ConferenceHallDropdown extends StatefulWidget {
  final Function callBackFunction;
  final String locationName;
  const ConferenceHallDropdown(
      {Key? key, required this.callBackFunction, required this.locationName})
      : super(key: key);

  @override
  State<ConferenceHallDropdown> createState() => _ConferenceHallDropdownState();
}

class _ConferenceHallDropdownState extends State<ConferenceHallDropdown> {
  String? conferenceRoomChoosed;
  late Future<ConferenceHallDetails> conferenceHallDetailsResponse;
  List<ConferenceHallData>? conferenceHallList;
  bool isLoading = true;
  SyncfusionCalendar obj = SyncfusionCalendar();

  Future<void> _fetchConferenceHallData() async {
    try {
      final conferenceHalls = await conferenceHallDetailsResponse;
      setState(() {
        conferenceHallList = conferenceHalls.data;
        isLoading = false;
      });
    } catch (error) {
      // Handle any errors that occur during the API request
      print('Error fetching location data: $error');
      // You can also show an error message here if needed
    }
  }

  @override
  void initState() {
    super.initState();
    conferenceHallDetailsResponse = getConferenceHallDetails();
    _fetchConferenceHallData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator() // Show a loading indicator while fetching data
        : Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.transparent), // Set border color to transparent
            ),
            child: DropdownButton(
              menuMaxHeight: screenHeight * 0.3,
              borderRadius: BorderRadius.circular(10.0),
              dropdownColor: Colors.grey[200],
              underline: Container(height: 0),
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Select Conference Room',
                  style: TextStyle(
                    color: Color(0xFF898383),
                    fontSize: 10,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              items: conferenceHallList?.map((conferenceHalls) {
                    return DropdownMenuItem(
                      // hint: Text("Select Location"),
                      value: conferenceHalls.conferenceName,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(conferenceHalls.conferenceName ?? ''),
                      ),
                    );
                  }).toList() ??
                  [],
              onChanged: (newValue) {
                setState(() {
                  conferenceRoomChoosed = newValue.toString();
                  toBeUpdatedBookingData.conferenceName =
                      getConferenceHallId(conferenceRoomChoosed!);
                  toBeAddedBookingData.conferenceName =
                      getConferenceHallId(conferenceRoomChoosed!);
                  widget.callBackFunction(conferenceRoomChoosed);
                });
              },
              value: conferenceRoomChoosed,
            ));
  }
}
