// import 'package:conference_hall_booking/screens/home_screen.dart';
// import 'package:conference_hall_booking/screens/login_screen.dart';
// import 'package:conference_hall_booking/screens/profile_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/material/colors.dart';
// import 'package:get/get.dart';
//import 'source/constants.dart';

class NavigationDrawerFile extends StatelessWidget {
  final VoidCallback? onLogoutPressed;
  const NavigationDrawerFile({Key? key, this.onLogoutPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: const Color.fromARGB(255, 241, 231, 195),
        // elevation: 2,
        //color: Colors.black54,
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => ProfileScreen(),
            // ));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 20 + MediaQuery.of(context).padding.top,
                bottom: 20,
                left: 17),
            child: const Column(
              // Wrap with Row

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              // You can adjust the alignment as needed
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //padding: const EdgeInsets.all(24),
                    //Icon(CupertinoIcons.person_alt_circle,size: 35),
                    Icon(Icons.account_circle_rounded,
                        size: 120, color: Colors.white54),
                    SizedBox(width: 10),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: EdgeInsets.only(
                    //         top: 10,
                    //       ),
                    //       child: Text(
                    //         'Username',
                    //         style: TextStyle(
                    //           fontSize: 35, //color: Color(0xFFB88D05)
                    //           color: Color(0xFFB88D05),
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(height: 1),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          // ListTile(
          //   tileColor: Color.fromARGB(255, 241, 231, 195),
          //   leading: Icon(
          //     Icons.home,
          //     color: Color(0xFFB88D05),
          //   ),
          //   title: const Text(
          //     'Home',
          //     style: TextStyle(
          //         color: Color(0xFFB88D05),
          //         fontWeight: FontWeight.w700,
          //         fontSize: 23),
          //   ),
          //   // onTap: () =>
          //   //     Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   //   builder: (context) => const HomeScreen(),
          //   // )),
          // ),
          //const Divider(),

          ListTile(
              tileColor: const Color.fromARGB(255, 241, 231, 195),
              leading: const Icon(Icons.logout,
                  color: Color(0xFFB88D05)), //color: Color(0xFFB88D05)
              title: const Text(
                'Log out',
                style: TextStyle(
                    color: Color(0xFFB88D05),
                    fontWeight: FontWeight.w700,
                    fontSize: 23),
              ),
              onTap: () async {
                _showLogoutConfirmationDialog(context);
              }),
        ],
      ));

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                sharedPreferences.remove('token');
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
                // Navigate to the login screen and remove all previous routes
                // Close the drawer
                Navigator.pop(context);

                // Call the logout callback
                onLogoutPressed?.call();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
