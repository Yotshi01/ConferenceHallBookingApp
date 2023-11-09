import 'package:conference_hall_booking/api/rescheduling_request_api.dart';
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
  @override
  Widget build(BuildContext context) {
    return (currentUserData!.id == widget.bookingUserId)
        ? Container()
        : ElevatedButton(
            onPressed: () {
              _showRequestDialog(context);
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

  void _showRequestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String reason = ""; // Store the input reason

        return AlertDialog(
          title: Text("Reason for Request"),
          content: TextField(
            onChanged: (text) {
              reason = text;
            },
            decoration: InputDecoration(
              hintText: "Enter your reason here",
            ),
            maxLines: null,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                print("Reason: $reason");

                // You can use the 'reason' variable for further processing
                toBeAddedReschedulingRequestData.requestRequesterId =
                    currentUserData!.id;
                toBeAddedReschedulingRequestData.requestOrganizerId =
                    widget.bookingUserId;
                toBeAddedReschedulingRequestData.requestReason = reason;
                toBeAddedReschedulingRequestData.requestStatus = 'Pending';
                toBeAddedReschedulingRequestData.requestBookingId =
                    widget.bookingId;

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
                var response = await addReschedulingRequest(
                    toBeAddedReschedulingRequestData);
                if (response.status == 'success') {
                  print('Saved Changes');
                  final snackBar = SnackBar(
                    content: Text('Request Successfully'),
                    backgroundColor: Colors.green,
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                    content: Text('Failed to make a request'),
                    backgroundColor: Colors.red,
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                // print("Reason: $reason");
                 Navigator.of(context).pop();
              },
              child: Text("Send"),
            ),
          ],
        );
      },
    );
  }
}
