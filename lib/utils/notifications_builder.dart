import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class NotificationsBuilder extends StatefulWidget {
  const NotificationsBuilder({super.key});

  @override
  State<NotificationsBuilder> createState() => _NotificationsBuilderState();
}

class _NotificationsBuilderState extends State<NotificationsBuilder> {
  final HomeScreenState? homeScreenState = homeScreenKey.currentState;
  final String userName = 'John Doe'; // Replace with user's name
  // final String notificationTimeAgo =
  //     '5 min ago';

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            itemCount: listOfReschedulingRequestsResponse.length,
            itemBuilder: (context, index) {
              // final data = _notifications[index];
              // final notificationType = data['type'];

              // switch (notificationType) {
              //   case 'postpone_request':
              //     return _buildPostponeRequestNotification(data);

              //   case 'normal':
              //     return _buildNormalNotification(data);

              //   // Add more cases for different types...
              //   default:
              //     return Container(); // Default case or handle unknown type
              // }

              final data = listOfReschedulingRequestsResponse[index];

              return _buildPostponeRequestNotification(data);
            }));
  }

  Widget _buildPostponeRequestNotification(
      ReschedulingRequestResponseData data) {
    String requesterName = getUserNameById(data.requestRequesterId!);
    // String bookingUserName = getUserNameById(data.requestBookingUserId!);
    BookingData onBooking = getBookingByBookingId(data.requestBookingId!);
    String locationName = getLocationName(onBooking.bookingLocationId!);
    String conferenceHallName =
        getConferenceHallName(onBooking.bookingConferenceId);
    String conferenceHallImageName =
        getConferenceHallImageName(onBooking.bookingConferenceId!);
    final currentBookingDate = DateTime.tryParse(onBooking.bookingDate!);
    final requestRequesterUserProfileImageUrl =
        "${testBaseUrl}/uploads/users/${getUserImageNameById(data.requestRequesterId!)}";
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.027, screenHeight * 0.01,
          screenWidth * 0.027, screenHeight * 0.01),
      child: (currentUserData!.id == data.requestBookingUserId &&
              data.requestStatus == 'Pending')
          ? Card(
              elevation: 4.0,
              child: ExpansionTile(
                title: ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange[200],
                    radius: 30,
                    backgroundImage:
                        requestRequesterUserProfileImageUrl.isNotEmpty
                            ? NetworkImage(requestRequesterUserProfileImageUrl)
                            : null,
                    child: requestRequesterUserProfileImageUrl.isEmpty
                        ? Text(
                            requesterName.isNotEmpty
                                ? requesterName[0].toUpperCase()
                                : '',
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )
                        : null,
                  ),

                  // CircleAvatar(
                  //   backgroundColor: Colors.orange[200],
                  //   radius: 30,
                  //   child: Text(
                  //     requesterName.isNotEmpty
                  //         ? requesterName[0].toUpperCase()
                  //         : '',
                  //     style: const TextStyle(
                  //         fontSize: 25,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w700),
                  //   ),
                  // ),

                  title: Text(
                    "${requesterName.isEmpty ? '' : requesterName[0].toUpperCase()}${requesterName.substring(1)} has requested a reschedule",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  // subtitle: Text(
                  //   'Sent $notificationTimeAgo',
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'For Booking :',
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //   ),
                        // ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.library_books,
                              color: Colors.yellow,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Reason: ${data.requestReason}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.event_available,
                              color: Colors.blue,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Meeting: ${onBooking.bookingMeetingTitle}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.orange,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${convertStringDateIntoDesiredFormat(onBooking.bookingDate!)}, ${convertStringTimeIntoDesiredFormat(onBooking.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(onBooking.bookingEndTime!)}',
                                style: const TextStyle(
                                  color: Color(0xFF696767),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.pin_drop,
                              color: Colors.orange,

                              //color: Color(0xFFB88D05),
                              // color: Color(0xFF696767),
                              size: 30,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                ' ${locationName}, ${conferenceHallName}',
                                style: const TextStyle(
                                  color: Color(0xFF696767),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        if (currentBookingDate!.isAfter(DateTime.now()) ||
                            ((currentBookingDate!.day == DateTime.now().day &&
                                currentBookingDate!.month ==
                                    DateTime.now().month &&
                                currentBookingDate!.year ==
                                    DateTime.now().year &&
                                ((hourPartOfStringTime(
                                            onBooking.bookingStartTime!) >
                                        DateTime.now().hour) ||
                                    ((hourPartOfStringTime(
                                                onBooking.bookingStartTime!) ==
                                            DateTime.now().hour) &&
                                        (minutePartOfStringTime(
                                                onBooking.bookingStartTime!) >
                                            DateTime.now().minute))))))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add functionality for accept button
                                  Navigator.pop(context);

                                  navigatorKeys[BottomNavBarItem.home]!
                                      .currentState!
                                      .popUntil((route) => route.isFirst);

                                  context
                                      .read<BottomNavBarCubit>()
                                      .updateSelectedItem(
                                          BottomNavBarItem.home);

                                  navigatorKeys[BottomNavBarItem.home]!
                                      .currentState!
                                      .push(
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                currentBookingData: onBooking,
                                                currentConferenceRoomName:
                                                    conferenceHallName,
                                                currentLocationName:
                                                    locationName,
                                                currentConferenceHallImageName:
                                                    conferenceHallImageName,
                                                requestedEdit: true,
                                                data: data)),
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                child: const Text(
                                  'Reschedule',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // Add functionality for reject button
                                  var response =
                                      await responseToReschedulingRequest(
                                          data.requestId!, 'Rejected');
                                  if (response.status == 'success') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.grey,
                                        content: Text(
                                            "Rescheduling Request Rejected"),
                                      ),
                                    );
                                    Navigator.pop(context);
                                    if (homeScreenState != null) {
                                      homeScreenState!.loadData();
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.grey,
                                        content: Text(
                                            "Failed to rejected rescheduling Request"),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                child: const Text(
                                  'Reject',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          const Text(
                              'Meeting has already taken place! Now no action can be taken on the request.')
                      ],
                    ),
                  ),
                ],
              ),
            )
          : (currentUserData!.id == data.requestRequesterId)
              ? Card(
                  elevation: 4.0,
                  //
                  // margin: EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange[200],
                        radius: 30,
                        child: const Icon(Icons.outgoing_mail,
                            color: Colors.white),
                      ),
                      title: const Text(
                        'Meeting Reschedule Request',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      //trailing: Icon(Icons.expand_more),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.event_note,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    '${onBooking.bookingMeetingTitle}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            const Divider(
                              color: Color(0xFFC2C0C0),
                              thickness: 1.5,
                              height: 30,
                            ),

                            Row(
                              children: [
                                const Icon(
                                  Icons.library_books,
                                  color: Colors.orangeAccent,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Reason sent: ${data.requestReason}',
                                    style: const TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 16,
                                      fontFamily: 'Noto Sans',
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.pin_drop,
                                  color: Colors.orangeAccent,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    '${conferenceHallName}, ${locationName}',
                                    style: const TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 16,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  color: Colors.orangeAccent,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    '${convertStringDateIntoDesiredFormat(onBooking.bookingDate!)}, ${convertStringTimeIntoDesiredFormat(onBooking.bookingStartTime!)} to ${convertStringTimeIntoDesiredFormat(onBooking.bookingEndTime!)}',
                                    style: const TextStyle(
                                      color: Color(0xFF696767),
                                      fontSize: 16,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            if (currentBookingDate!.isAfter(DateTime.now()) ||
                                ((currentBookingDate!.day ==
                                        DateTime.now().day &&
                                    currentBookingDate!.month ==
                                        DateTime.now().month &&
                                    currentBookingDate!.year ==
                                        DateTime.now().year &&
                                    ((hourPartOfStringTime(
                                                onBooking.bookingEndTime!) >
                                            DateTime.now().hour) ||
                                        ((hourPartOfStringTime(onBooking
                                                    .bookingEndTime!) ==
                                                DateTime.now().hour) &&
                                            (minutePartOfStringTime(
                                                    onBooking.bookingEndTime!) >
                                                DateTime.now().minute))))))
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${data.requestStatus}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Noto Sans',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.error,
                                    color: Colors.redAccent,
                                    size: 35,
                                  ),
                                ],
                              )
                            else
                              const Text(
                                'Meeting has now taken place! No response was received.',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
    );
  }
}
