import 'package:conference_hall_booking/screens/home_screen.dart';
import 'package:conference_hall_booking/screens/login_screen.dart';
import 'package:conference_hall_booking/screens/settings_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class NavigationDrawerFile extends StatelessWidget {
  const NavigationDrawerFile({super.key});

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

        color: Colors.yellow[100],
    //color: const Color.fromARGB(191, 237, 145, 7),
        // elevation: 2,
        child: InkWell(
          onTap: () {

          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
              left: 24,
            ),
            child: Column(
              // Wrap with Row

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              // You can adjust the alignment as needed
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.005,
                    screenHeight * 0.005,
                    screenWidth * 0.005,
                    screenHeight * 0.005,
                  ),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/booking.png",
                      width: screenWidth * 0.3,


                    ),
                  )

                ),
                const Divider(color: Colors.black54),
                //const SizedBox(width: 16),
                 Row(

                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //padding: const EdgeInsets.all(24),
                    //Icon(CupertinoIcons.person_alt_circle,size: 35),
                    Icon(Icons.account_circle_rounded,size:77,color: Colors.amber[800]),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                          child: Text(
                            'User',
                            style: TextStyle(fontSize: 35, color: Colors.amber[800]),
                          ),
                        ),

                        Text(
                          'user@abc.com',
                          style: TextStyle(fontSize: 17, color: Colors.amber[800]),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            )),
          ),
          //const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ));
            },
          ),
          //const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )),
          ),
        ],
      ));
}
