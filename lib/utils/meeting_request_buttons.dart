import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class MeetingUpdateButtons extends StatefulWidget {
  final int bookingUserId;
  final int bookingId;
  const MeetingUpdateButtons(
      {Key? key, required this.bookingUserId, required this.bookingId})
      : super(key: key);

  @override
  State<MeetingUpdateButtons> createState() => _MeetingUpdateButtonsState();
}

class _MeetingUpdateButtonsState extends State<MeetingUpdateButtons> {
  bool isReasonTextValid = false;
  @override
  Widget build(BuildContext context) {
    return (currentUserData!.id == widget.bookingUserId)
        ? Container()
        : ElevatedButton(
            onPressed: () {
              _showRequestDialog(context);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size(40, 40)), // Set your desired size
              padding: MaterialStateProperty.all(
                  EdgeInsets.zero), // Remove default padding
              //backgroundColor: MaterialStateProperty.all(Colors.blue), // Change background color if needed
              // Other style properties you might want to adjust
            ),
            // ),
            child: const Icon(Icons.outgoing_mail),
            // child: Container(
            //   width: screenWidth * 0.27,
            //   height: screenHeight * 0.03,
            //   decoration: BoxDecoration(
            //     color: Color(0xFFFFC304),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color(0x3F000000),
            //         // blurRadius: 4,
            //         // offset: Offset(0, 4),
            //         spreadRadius: 0,
            //       ),
            //     ],
            //   ),
            //   child: Center(
            //     child: Text(
            //       "Request",
            //       style: TextStyle(
            //         color: Colors.black, // You can set your text color here
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ),
            // ),
          );
  }

  void _showRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String reason = ""; // Store the input reason

        return AlertDialog(
          title: const Text("Send rescheduling request"),
          content: TextField(
            onChanged: (text) {
              reason = text;
              if (text.isNotEmpty && text.length <= 250) {
                setState(() {
                  isReasonTextValid = true;
                });
              } else {
                setState(() {
                  isReasonTextValid = false;
                });
              }
            },
            decoration: InputDecoration(
              hintText: "Enter your reason here",
              labelText:
                  !isReasonTextValid ? 'Not more than 250 letters' : null,
              border: OutlineInputBorder(
                // Adjust these values to position the label inside the border
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                // Adjust these values for focused state
                borderSide: const BorderSide(width: 2.0, color: Colors.amber),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            maxLines: null,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // print("Reason: $reason");

                // You can use the 'reason' variable for further processing
                toBeAddedReschedulingRequestData.requestRequesterId =
                    currentUserData!.id;
                toBeAddedReschedulingRequestData.requestBookingUserId =
                    widget.bookingUserId;
                toBeAddedReschedulingRequestData.requestReason = reason;
                toBeAddedReschedulingRequestData.requestStatus = 'Pending';
                toBeAddedReschedulingRequestData.requestBookingId =
                    widget.bookingId;
                toBeAddedReschedulingRequestData.bookingRequestCreatedAt =
                    DateTime.now().toString();

                // var response = await addReschedulingRequest(
                //     toBeAddedReschedulingRequestData);

                // if (response.status == 'success') {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text("Requested successfully!"),
                //   ));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text("Failed to make a request!"),
                //   ));
                // }

                // print("Reason: $reason");

                if (isReasonTextValid == true) {
                  Navigator.of(context).pop();
                  var response = await addReschedulingRequest(
                      toBeAddedReschedulingRequestData);
                  if (response.status == 'success') {
                    // print('Saved Changes');
                    const snackBar = SnackBar(
                      content: Text('Requested Successfully'),
                      backgroundColor: Colors.green,
                      duration:
                          Duration(seconds: 3), // Adjust the duration as needed
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text("Failed to send request!"),
                      ),
                    );
                  }
                } else {
                  // Navigator.of(context).pop();
                  Fluttertoast.showToast(
                      msg: 'Please enter some text not exceeding 250 letters!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      // timeInSecForIos: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     backgroundColor: Colors.grey,
                  //     content: Text(
                  //         "Please enter some text not exceeding 250 letters!"),
                  //   ),
                  // );
                }
              },
              child: const Text("Send"),
            ),
          ],
        );
      },
    );
  }
}
