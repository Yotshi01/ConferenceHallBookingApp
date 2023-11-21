import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class ConferenceHallDropdown extends StatefulWidget {
  final Function callBackFunction;
  final String locationName;
  final String? initialSelectedConferenceHall;
  const ConferenceHallDropdown({
    Key? key,
    required this.callBackFunction,
    required this.locationName,
    this.initialSelectedConferenceHall,
  }) : super(key: key);

  @override
  State<ConferenceHallDropdown> createState() => _ConferenceHallDropdownState();
}

class _ConferenceHallDropdownState extends State<ConferenceHallDropdown> {
  // String? conferenceRoomChoosed;
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
      print('Error fetching conference hall data: $error');
      // You can also show an error message here if needed
    }
  }

  @override
  void initState() {
    super.initState();
    conferenceHallDetailsResponse = getConferenceHallDetails();
    _fetchConferenceHallData();
    conferenceHallsAtSelectedLocation =
        getConferenceHallDataAccordingToSelectedLocation(widget.locationName);

    if (widget.initialSelectedConferenceHall != null) {
      // If an initial location is provided, set it as the selected value.
      conferenceRoomChoosed = widget.initialSelectedConferenceHall;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator() // Show a loading indicator while fetching data
        : Container(
            width: screenWidth * 0.95,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 219, 158),
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
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              items: conferenceHallsAtSelectedLocation.map((conferenceHalls) {
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
                  toBeUpdatedBookingData.bookingConferenceId =
                      getConferenceHallId(conferenceRoomChoosed!);
                  toBeAddedBookingData.bookingConferenceId =
                      getConferenceHallId(conferenceRoomChoosed!);
                  widget.callBackFunction(conferenceRoomChoosed);
                  print(
                      '${widget.locationName}, ${conferenceRoomChoosed} cjadasdakmx');

                  listOfFilteredMeetingsAccordingToDropdownSelections =
                      getBookingDataAccordingToSelectedLocationAndConferenceHall(
                          widget.locationName, conferenceRoomChoosed!);
                  print(
                      '${listOfFilteredMeetingsAccordingToDropdownSelections} thidrhkhsdjnsafefaefaf');
                });
              },
              value: conferenceRoomChoosed,
            ));
  }
}
