import 'package:flutter/material.dart';
import 'package:conference_hall_booking/reusables/reusable_widgets.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/common_packages_export.dart';

class DetailsScreen extends StatefulWidget {
  final BookingData currentBookingData;
  final String currentConferenceRoomName;
  final String currentLocationName;
  const DetailsScreen(
      {Key? key,
      required this.currentBookingData,
      required this.currentConferenceRoomName,
      required this.currentLocationName})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Detail',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.25,
              letterSpacing: 0.16,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                width: screenWidth,
                // height: screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.21, -0.98),
                    end: Alignment(-0.21, 0.98),
                    colors: [Colors.white, Color(0x00DBCC95)],
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    bookNow(context),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 352,
                        // height: 641,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Padding(
                  padding: EdgeInsets.symmetric(
                    
                    horizontal: screenWidth*0.01,
                  ),
                  child: Column(children: [Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                    "assets/images/meeting-room5.png",
                    width: screenWidth * 0.24,
                    height: screenHeight*0.15 ,
                  ),)],),),
                            
                            Text(
                              'Meeting Title',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            Text(
                              '${widget.currentBookingData.meetingTitle}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Conference Room Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            Text(
                              widget.currentConferenceRoomName,
                              style: TextStyle(
                                color: Color(0xFFB88D05),
                                fontSize: 16,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Date, time and location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            Row(
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
                                          horizontal: 5,
                                        ),
                                        child: Text(
                                          '${widget.currentBookingData.bookingDate}, Sat - ${widget.currentBookingData.strTime} to ${widget.currentBookingData.endTime}',
                                          style: TextStyle(
                                            color: Color(0xFF696767),
                                            fontSize: 12,
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons
                                      .pin_drop_outlined, // Replace with the icon you want
                                  color: Colors
                                      .yellow, // Set the color of the icon
                                  size: 24, // Set the size of the icon
                                ),
                                // SizedBox(
                                //     width:
                                //         8), // Add some spacing between the icon and text
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        child: Text(
                                          widget.currentLocationName,
                                          style: TextStyle(
                                            color: Color(0xFF696767),
                                            fontSize: 14,
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Meeting Description',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            SizedBox(
                              width: 304,
                              height: 67,
                              child: Text(
                                '${widget.currentBookingData.meetingDes}',
                                style: TextStyle(
                                  color: Color(0xFF918C8C),
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              'About Room',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            Text(
                              getConferenceHallDescription(
                                  widget.currentBookingData.conferenceName!),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Other Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              color: Color(
                                  0xFFC2C0C0), // Set the color of the divider line
                              thickness:
                                  1, // Set the thickness of the divider line
                            ),
                            Text(
                              '${widget.currentBookingData.otherDetails}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Noto Sans',
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: MeetingUpdateButtons(
                                bookingUserId:
                                    widget.currentBookingData.userId!,
                              ),
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
