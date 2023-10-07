import 'package:conference_hall_booking/source/constants.dart';
import 'package:flutter/material.dart';

class NotificationsBuilder extends StatefulWidget {
  const NotificationsBuilder({super.key});

  @override
  State<NotificationsBuilder> createState() => _NotificationsBuilderState();
}

class _NotificationsBuilderState extends State<NotificationsBuilder> {
  final List<Map<String, dynamic>> _notifications = [
    {"id": 1, "notification": "notification1"},
    {"id": 2, "notification": "notification2"},
    {"id": 3, "notification": "notification3"},
    {"id": 4, "notification": "notification4"},
    {"id": 5, "notification": "notification5"},
    {"id": 6, "notification": "notification6"},
    {"id": 7, "notification": "notification7"},
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
        width: screenWidth,
        height: screenHeight * 0.86,
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final data = _notifications[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.027,
                    screenHeight * 0.01,
                    screenWidth * 0.027,
                    screenHeight * 0.01),
                child: Container(
                  width: 364,
                  height: 109,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Text(
                            '24 Aug 2023 01:00 PM',
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF848080),
                              fontSize: 10,
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          //SizedBox(
                          //  width: 16.0, // Adjust the width as needed
                          //),
                          SizedBox(
                            width: screenWidth * 0.53,
                          ),
                          Icon(
                            Icons.mail, // Replace with the icon you want
                            color: Color(0xFF696767),
                            // Set the color of the icon
                            size: 16, // Set the size of the icon
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Management CDM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Color(0xFFC2C0C0),
                        // Set the color of the divider line
                        thickness: 1, // Set the thickness of the divider line
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Conference  Room Floor - 02',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFB88D05),
                            fontSize: 12,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: Color(0xFFB88D05),
                              // Set the color of the icon
                              size: 28,
                            ),
                            SizedBox(
                              width: screenWidth * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '26 Aug 2023, Sat - 01:00 PM to 02:00 PM',
                                    style: TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 11,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Corporate Center Raipur ',
                                    style: TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 11,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
