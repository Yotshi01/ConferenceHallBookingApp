import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/api/location_details_api.dart';
import 'package:conference_hall_booking/models/locations.dart';

class LocationsDropdown extends StatefulWidget {
  const LocationsDropdown({super.key});

  @override
  State<LocationsDropdown> createState() => _LocationsDropdownState();
}

class _LocationsDropdownState extends State<LocationsDropdown> {
  String? locationChoosed;
  late Future<LocationDetails> locationDetailsResponse;
  List<LocationData>? locationsList;
  bool isLoading = true;

  Future<void> _fetchLocationData() async {
    try {
      final locations = await locationDetailsResponse;
      setState(() {
        locationsList = locations.data;
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
    locationDetailsResponse =
        getLocationDetails(); // Initialize the Future here
    _fetchLocationData();
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
                  'Select Location',
                  style: TextStyle(
                    color: Color(0xFF898383),
                    fontSize: 10,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              items: locationsList?.map((location) {
                    return DropdownMenuItem(
                      value: location.locationName,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(location.locationName ?? ''),
                      ),
                    );
                  }).toList() ??
                  [], // Use the location names from the API
              onChanged: (newValue) {
                setState(() {
                  locationChoosed = newValue.toString();
                  toBeUpdatedBookingData.locationName =
                      getLocationId(locationChoosed!);
                  toBeAddedBookingData.locationName =
                      getLocationId(locationChoosed!);
                });
              },
              value: locationChoosed,
            ),
          );
  }
}
