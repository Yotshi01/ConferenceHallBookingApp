import 'package:flutter/material.dart';
import 'package:conference_hall_booking/reusables/reusable_widgets.dart';
import 'package:conference_hall_booking/source/constants.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

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
                        height: 641,
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
                          children: [
                            SizedBox(
                              height: screenHeight * 0.2,
                            ),
                            Text(
                              'Management CDM',
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
                              'Conference Room Floor - 02',
                              style: TextStyle(
                                color: Color(0xFFB88D05),
                                fontSize: 16,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w600,
                              ),
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
                                          '26 Aug 2023, Sat - 01:00 PM to 02:00 PM',
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
                                          'Corporate Center Raipur ',
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
                              width: 304,
                              height: 67,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                                style: TextStyle(
                                  color: Color(0xFF918C8C),
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              'About this room',
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
                                'Large meeting room that fits up to 15 people with glass walls that can be used as white board to express your creativity.',
                                style: TextStyle(
                                  color: Color(0xFF918C8C),
                                  fontSize: 14,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              'Other Requirements',
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
                              'Refreshment',
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your book now functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFC304),
                                    elevation: 4,
                                  ),
                                  child: Container(
                                    width: screenWidth * 0.27,
                                    height: screenHeight * 0.03,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFC304),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          // blurRadius: 4,
                                          // offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Edit/Update",
                                        style: TextStyle(
                                          color: Colors
                                              .black, // You can set your text color here
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your book now functionality here
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Reason for Postpone Meeting'),
                                          content: Container(
                                            width: 331,
                                            height: 313,
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: const Column(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Type a valid reason for postponing the meeting',
                                                        labelStyle: TextStyle(
                                                          color:
                                                              Color(0xFFC1BEBE),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'Noto Sans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .amber),
                                                        ),
                                                      ),
                                                      maxLines: 10,
                                                      minLines: 5,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            // TextButton(

                                            //     Navigator.of(context).pop(); // Close the dialog
                                            //   },
                                            //   child: Text('Postpone'),
                                            // ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                width: 98,
                                                height: 33,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFC304),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x3F000000),
                                                      blurRadius: 4,
                                                      offset: Offset(0, 4),
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    // Handle the action when the "Send" button is clicked
                                                    // You can access the reason in _reasonController.text
                                                    // Add your logic here
                                                    Navigator.of(context).pop();

                                                    // Close the dialog
                                                  },
                                                  child: Text(
                                                    'Send',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFC304),
                                    elevation: 4,
                                  ),
                                  child: Container(
                                    width: screenWidth * 0.27,
                                    height: screenHeight * 0.03,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFC304),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          // blurRadius: 4,
                                          // offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Postpone",
                                        style: TextStyle(
                                          color: Colors
                                              .black, // You can set your text color here
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ))));
  }
}
