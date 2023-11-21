import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class NotificationsBuilder extends StatefulWidget {
  const NotificationsBuilder({super.key});

  @override
  State<NotificationsBuilder> createState() => _NotificationsBuilderState();
}

class _NotificationsBuilderState extends State<NotificationsBuilder> {
  final String userName = 'John Doe'; // Replace with user's name
  final String notificationTimeAgo =
      '5 min ago'; // Replace with notification timestamp
  final List<Map<String, dynamic>> _notifications = [
    {"id": 1, "type": "normal", "notification": "notification1"},
    {"id": 2, "type": "normal", "notification": "notification2"},
    {"id": 3, "type": "normal", "notification": "notification3"},
    {"id": 4, "type": "normal", "notification": "notification4"},
    {"id": 5, "type": "normal", "notification": "notification5"},
    {"id": 6, "type": "normal", "notification": "notification6"},
    {"id": 7, "type": "postpone_request", "notification": "notification7"},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final data = _notifications[index];
              final notificationType = data['type'];

              switch (notificationType) {
                case 'normal':
                  return _buildNormalNotification(data);
                case 'postpone_request':
                  return _buildPostponeRequestNotification(data);
                // Add more cases for different types...
                default:
                  return Container(); // Default case or handle unknown type
              }
            }));
  }

  Widget _buildNormalNotification(Map<String, dynamic> data) {
    // Customize the appearance for type1 notifications
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.027, screenHeight * 0.01,
          screenWidth * 0.027, screenHeight * 0.01),
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
                  width: screenWidth * 0.34,
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
  }

  Widget _buildPostponeRequestNotification(Map<String, dynamic> data) {
    // Customize the appearance for type2 notifications
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.027, screenHeight * 0.01,
          screenWidth * 0.027, screenHeight * 0.01),
      child: Card(
        elevation: 4.0,
        child: ExpansionTile(
          title: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: CircleAvatar(
              backgroundColor: Colors.black26,
              radius: 30,
              child: Text(
                'S',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            title: Text(
              userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              'Sent $notificationTimeAgo',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
