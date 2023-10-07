import 'package:flutter/material.dart';
import 'package:conference_hall_booking/api/conference_hall_details_api.dart';
import 'package:conference_hall_booking/models/conference_hall_details.dart';

class ConferenceHallDropdown extends StatefulWidget {
  const ConferenceHallDropdown({super.key});

  @override
  State<ConferenceHallDropdown> createState() => _ConferenceHallDropdownState();
}

class _ConferenceHallDropdownState extends State<ConferenceHallDropdown> {
  String? conferenceRoomChoosed;
  late Future<ConferenceHallDetails> conferenceHallDetailsResponse;
  List<ConferenceHallData>? conferenceHallList;
  bool isLoading = true;

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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator() // Show a loading indicator while fetching data
          : DropdownButton(
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
                      child: Text(conferenceHalls.conferenceName ?? ''),
                    );
                  }).toList() ??
                  [],
              onChanged: (newValue) {
                setState(() {
                  conferenceRoomChoosed = newValue.toString();
                });
              },
              value: conferenceRoomChoosed,
            ),
    );
  }
}
