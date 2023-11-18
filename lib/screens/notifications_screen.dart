import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final String userName = 'John Doe'; // Replace with user's name
  final String notificationTimeAgo =
      '5 min ago'; // Replace with notification timestamp

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 1,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment(0.21, -0.98),
      //         end: Alignment(-0.21, 0.98),
      //         colors: [Colors.white, Color(0x00DBCC95)],
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     'Notification',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 20,
      //       fontFamily: 'Noto Sans',
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
      body: Container(
          color: Colors.amber[50],
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.26,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Notifications',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 25.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.002,
                ),
                NotificationsBuilder(),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  color: Colors.amber[100],
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                // Replace with user's profile picture
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150'), // Placeholder image URL
                                radius: 30.0,
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                'Sent $notificationTimeAgo',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Request notification from 10:00 AM to 11:00 AM',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality for accept button
                            },
                            child: Text('Accept'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality for reject button
                            },
                            child: Text('Deny'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
