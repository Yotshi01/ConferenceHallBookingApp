import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/screens/details_screen.dart';

class TodaysConferences extends StatefulWidget {
  TodaysConferences({super.key});

  @override
  State<TodaysConferences> createState() => _TodaysConferencesState();
}

class _TodaysConferencesState extends State<TodaysConferences> {
  // late Future<BookingDetails> bookingDetailsResponse;
  // List<BookingDetails>

  // Future<void> _fetchBookingDetails() async{
  //   try {
  //     bookingDetailsResponse = getBookingDetails();
  //     setState(() {
  //       listOfBookings = data.data!.map((item) {
  //           return Data.fromJson(item.toJson());
  //         }).toList();
  //     });
  //   } catch (error) {
  //     print('Error fetching pending list data: $error');
  //   }

  // }

  @override
  void initState() {
    super.initState();
  }

  final List<Map<String, dynamic>> _conferences = [
    {"id": 1, "conference": "conference1"},
    {"id": 2, "conference": "conference2"},
    {"id": 3, "conference": "conference3"},
    {"id": 4, "conference": "conference4"},
    {"id": 5, "conference": "conference5"},
    {"id": 6, "conference": "conference6"},
    {"id": 7, "conference": "conference7"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment(0.21, -0.98),
        //     end: Alignment(-0.21, 0.98),
        //     colors: [Colors.white, Color(0x00DBCC95)],
        //   ),
        // ),
        // color: Colors.blue,
        height: screenHeight * 0.3,
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.horizontal,
            itemCount: _conferences.length,
            itemBuilder: (context, index) {
              final data = _conferences[index];
              return Padding(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.027,
                      screenHeight * 0.01,
                      screenWidth * 0,
                      screenHeight * 0.01),
                  child: Container(
                    key: ValueKey(data["id"]),
                    width: screenWidth * 0.46,
                    // height: screenHeight * 0.2,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add your onPressed callback function here
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0x59FFC304), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4, // Shadow blur radius
                            ),
                            child: Container(
                              width: 91,
                              height: 27,
                              child: const Center(
                                child: Text(
                                  "View Detail",
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              child: Text(
                            'Conference Room Floor - 02',
                            style: TextStyle(
                              color: Color(0xFFB88D05),
                              fontSize: 13,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                          const Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Color(
                                0xFFC2C0C0), // Set the color of the divider line
                            thickness:
                                1, // Set the thickness of the divider line
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Management meetup',
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                          const Row(
                            children: [
                              Icon(
                                Icons
                                    .av_timer, // Replace with the icon you want
                                color: Color(
                                    0xFF696767), // Set the color of the icon
                                size: 24, // Set the size of the icon
                              ),
                              // SizedBox(
                              //     width:
                              //         8), // Add some spacing between the icon and text
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                      ),
                                      child: Text(
                                        'Sat | 01:00 PM to 02:00 PM',
                                        style: TextStyle(
                                          color: Color(0xFF696767),
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )))
                            ],
                          )
                        ]),
                  ));
            }));
  }
}
