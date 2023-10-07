import 'package:conference_hall_booking/source/constants.dart';
import 'package:flutter/material.dart';

class OldMeetings extends StatelessWidget {
  final List<Map<String, dynamic>> _meetings = [
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
        height: screenHeight * 0.2,
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.horizontal,
            itemCount: _meetings.length,
            itemBuilder: (context, index) {
              final data = _meetings[index];
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
                          Row(
                            children: [
                              Icon(
                                Icons
                                    .pin_drop_outlined, // Replace with the icon you want
                                color:
                                    Colors.amber, // Set the color of the icon
                                size: 51, // Set the size of the icon
                              ),
                              // SizedBox(
                              //     width:
                              //         8), // Add some spacing between the icon and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      'Raipur',
                                      style: TextStyle(
                                        color: Color(0xFF131212),
                                        fontSize: 13,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Color(0xFFD7D7D7),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'Sat 25 Aug 2023',
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9B9595),
                                        fontSize: 10,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ]),
                  ));
            }));
  }
}
