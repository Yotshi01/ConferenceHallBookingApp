import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                          print('Closing dialog...');
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
              ],
            ),
          )),
    );
  }
}
