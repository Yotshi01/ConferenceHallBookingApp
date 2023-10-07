import 'package:conference_hall_booking/screens/home_screen.dart';
import 'package:conference_hall_booking/screens/login_screen.dart';
import 'package:conference_hall_booking/screens/settings_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/material/colors.dart';
// import 'package:get/get.dart';
import 'source/constants.dart';

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
        color: const Color(0x28FFC677),
        //color: const Color.fromARGB(191, 237, 145, 7),
        // elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
                top: 20 + MediaQuery.of(context).padding.top,
                bottom: 20,
                left: 17),
            child: Column(
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
                        size: 120, color: Colors.black26),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 35, color: Colors.amber[800]),
                          ),
                        ),
                        const SizedBox(height: 1),
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
            tileColor: Color.fromRGBO(255, 170, 0, 0.19),
            leading: Icon(
              Icons.home,
              color: Colors.amber[800],
            ),
            title: const Text('Home'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            )),
          ),
          //const Divider(),
          ListTile(
            tileColor: Color.fromRGBO(255, 170, 0, 0.19),
            leading: Icon(
              Icons.settings,
              color: Colors.amber[800],
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ));
            },
          ),
          //const Divider(),
          ListTile(
              tileColor: Color.fromRGBO(255, 170, 0, 0.19),
              leading: Icon(Icons.logout, color: Colors.amber[800]),
              title: const Text('Log out'),
              onTap: () async {
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //   builder: (context) => const LoginScreen(),
                // ));
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                sharedPreferences.remove('token');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ));
}
