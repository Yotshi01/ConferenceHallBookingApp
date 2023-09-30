import 'package:flutter/material.dart';
import 'package:conference_hall_booking/constants.dart';

class BookingAlertDialog extends StatefulWidget {
  const BookingAlertDialog({super.key});

  @override
  State<BookingAlertDialog> createState() => _BookingAlertDialogState();
}

class _BookingAlertDialogState extends State<BookingAlertDialog> {
  String? locationChoosed;
  String? conferenceRoomChoosed;
  List listLocations = [
    "Raipur",
    "Deorjhal",
    "Kohadia",
  ];
  List listConferenceRooms = [
    "1",
    "2",
    "3",
  ];
  TextEditingController _meetingTitleController = TextEditingController();
  TextEditingController _meetingDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      scrollable: true,
      title: Text("Event Booking"),
      content: Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await _selectedDateTime(context);
                    if (selectedDate == null) return;
                    print(selectedDate);
                  },
                  child: Text('Select Date'),
                ),
                SizedBox(
                  width: screenWidth * 0.03,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final selectedTime = await _selectedTime(context);
                    if (selectedTime == null) return;
                    print(selectedTime);
                  },
                  child: Text('Select Time'),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'Select Location for Conference',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: DropdownButton(
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
                items: listLocations.map((valueItem) {
                  return DropdownMenuItem(
                    // hint: Text("Select Location"),
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    locationChoosed = newValue.toString();
                  });
                },
                value: locationChoosed,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: DropdownButton(
                underline: Container(height: 0),
                icon: Icon(Icons.arrow_drop_down),
                isExpanded: true,
                hint: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Select Conference Room',
                    style: TextStyle(
                      color: Color(0xFF898383),
                      fontSize: 10,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                items: listConferenceRooms.map((valueItem) {
                  return DropdownMenuItem(
                    // hint: Text("Select Location"),
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    conferenceRoomChoosed = newValue.toString();
                  });
                },
                value: conferenceRoomChoosed,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'Meeting Title',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            TextField(
              controller: _meetingTitleController,
              decoration: InputDecoration(
                // labelText:
                //     'Type a valid reason for postponing the meeting',
                // labelStyle: TextStyle(
                //   color: Color(0xFFC1BEBE),
                //   fontSize: 12,
                //   fontFamily: 'Noto Sans',
                //   fontWeight: FontWeight.w400,
                // ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'Meeting Description',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            TextField(
              controller: _meetingDescriptionController,
              decoration: InputDecoration(
                // labelText:
                //     'Type a valid reason for postponing the meeting',
                // labelStyle: TextStyle(
                //   color: Color(0xFFC1BEBE),
                //   fontSize: 12,
                //   fontFamily: 'Noto Sans',
                //   fontWeight: FontWeight.w400,
                // ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
              maxLines: 7,
              minLines: 3,
            )
          ],
        ),
      ),
      actions: [
        // ElevatedButton(
        //   onPressed: () {
        //     // _events!.addAll({
        //     //   _selectedDay: [Event(_eventController.text)]
        //     // });

        //     // _events!.update(_selectedDay, (events) {
        //     //   if (events != null) {
        //     //     events.add(Event(_eventController.text));
        //     //     return events;
        //     //   } else {
        //     //     return [Event(_eventController.text)];
        //     //   }
        //     // });

        //     if (!_events!.containsKey(_selectedDay)) {
        //       _events![_selectedDay] = [
        //         Event(_eventController.text)
        //       ];
        //     } else {
        //       _events![_selectedDay]!
        //           .add(Event(_eventController.text));
        //     }

        //     Navigator.of(context).pop();
        //     _selectedEvents.value = _getEventsForDay(_selectedDay);
        //   },
        //   child: Text("Submit"),
        // ),
      ],
    );
  }

  Future<TimeOfDay?> _selectedTime(BuildContext context) {
    final now = DateTime.now();
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }

  Future<DateTime?> _selectedDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}
