import 'package:conference_hall_booking/source/constants.dart';
import 'package:flutter/material.dart';

class MeetingUpdateButtons extends StatefulWidget {
  final int bookingUserId;
  const MeetingUpdateButtons({Key? key, required this.bookingUserId})
      : super(key: key);

  @override
  State<MeetingUpdateButtons> createState() => _MeetingUpdateButtonsState();
}

class _MeetingUpdateButtonsState extends State<MeetingUpdateButtons> {
  @override
  Widget build(BuildContext context) {
    return (currentUserData!.id == widget.bookingUserId)
        ?
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ElevatedButton(
        //         onPressed: () {
        //           // Add your book now functionality here
        //         },
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Color(0xFFFFC304),
        //           elevation: 4,
        //         ),
        //         child: Container(
        //           width: screenWidth * 0.27,
        //           height: screenHeight * 0.03,
        //           decoration: BoxDecoration(
        //             color: Color(0xFFFFC304),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Color(0x3F000000),
        //                 // blurRadius: 4,
        //                 // offset: Offset(0, 4),
        //                 spreadRadius: 0,
        //               ),
        //             ],
        //           ),
        //           child: Center(
        //             child: Text(
        //               "Save Changes",
        //               style: TextStyle(
        //                 color: Colors.black, // You can set your text color here
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 15,
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           // Add your book now functionality here
        //           showDialog(
        //             context: context,
        //             builder: (context) {
        //               return AlertDialog(
        //                 title: Text('Reason for Postpone Meeting'),
        //                 content: Container(
        //                   width: 331,
        //                   height: 313,
        //                   decoration: BoxDecoration(color: Colors.white),
        //                   child: const Column(
        //                     children: [
        //                       Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         children: [
        //                           SizedBox(height: 10),
        //                           TextField(
        //                             decoration: InputDecoration(
        //                               labelText:
        //                                   'Type a valid reason for postponing the meeting',
        //                               labelStyle: TextStyle(
        //                                 color: Color(0xFFC1BEBE),
        //                                 fontSize: 12,
        //                                 fontFamily: 'Noto Sans',
        //                                 fontWeight: FontWeight.w400,
        //                               ),
        //                               border: OutlineInputBorder(
        //                                 borderSide:
        //                                     BorderSide(color: Colors.amber),
        //                               ),
        //                             ),
        //                             maxLines: 10,
        //                             minLines: 5,
        //                           )
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 actions: [
        //                   // TextButton(

        //                   //     Navigator.of(context).pop(); // Close the dialog
        //                   //   },
        //                   //   child: Text('Postpone'),
        //                   // ),
        //                   Align(
        //                     alignment: Alignment.bottomCenter,
        //                     child: Container(
        //                       width: 98,
        //                       height: 33,
        //                       decoration: BoxDecoration(
        //                         color: Color(0xFFFFC304),
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Color(0x3F000000),
        //                             blurRadius: 4,
        //                             offset: Offset(0, 4),
        //                             spreadRadius: 0,
        //                           )
        //                         ],
        //                       ),
        //                       child: TextButton(
        //                         onPressed: () {
        //                           // Handle the action when the "Send" button is clicked
        //                           // You can access the reason in _reasonController.text
        //                           // Add your logic here
        //                           Navigator.of(context).pop();

        //                           // Close the dialog
        //                         },
        //                         child: Text(
        //                           'Send',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               );
        //             },
        //           );
        //         },
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Color(0xFFFFC304),
        //           elevation: 4,
        //         ),
        //         child: Container(
        //           width: screenWidth * 0.27,
        //           height: screenHeight * 0.03,
        //           decoration: BoxDecoration(
        //             color: Color(0xFFFFC304),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Color(0x3F000000),
        //                 // blurRadius: 4,
        //                 // offset: Offset(0, 4),
        //                 spreadRadius: 0,
        //               ),
        //             ],
        //           ),
        //           child: Center(
        //             child: Text(
        //               "Postpone",
        //               style: TextStyle(
        //                 color: Colors.black, // You can set your text color here
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   )
        Container()
        : ElevatedButton(
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
                  "Request",
                  style: TextStyle(
                    color: Colors.black, // You can set your text color here
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
  }
}
