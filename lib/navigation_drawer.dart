import 'package:flutter/material.dart';

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
      color: const Color.fromARGB(191, 237, 145, 7),
      // elevation: 2,
      child: InkWell(
          onTap: () {
            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder:(context) => const UserPage(),
            // ));
          },
          child: Container(
              padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    // backgroundImage: AssetImage(
                    //   'assets/images/logo4.png'
                    // ),
                  ),
                  SizedBox(height: 12),
                  // Text('prasadam@gmail.com',
                  //     style: TextStyle(fontSize: 16, color: Colors.black))
                ],
              ))));

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          //   ListTile(
          //   leading: const Icon(Icons.home_outlined),
          //   title: const Text('Home'),
          //   onTap: () => {
          //     Navigator.pop(context),
          //   Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const HomeScreen(),
          //   )),
          //   }
          // ),
          // ListTile(
          //   leading: const Icon(Icons.favorite_border),
          //   title: const Text('Favourites'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder:(context) => const FavouritesPage(),
          //     ));
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.subscriptions_outlined),
          //   title: const Text('Subscription'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder:(context) => const SubscriptionsPage(),
          //     ));
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder:(context) => const DailyUpdatesPage(),
              // ));
              Navigator.pop(context);
            },
          ),
          // const Divider(color: Colors.black54),
          // ListTile(
          //   leading: const Icon(Icons.notification_add),
          //   title: const Text('Notifications'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder:(context) => const NotificationsPage(),
          //     ));
          //   },
          // ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder:(context) => const UserPage(),
              // ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder:(context) => const ContactUsPage(),
              // ));
            },
          ),
        ],
      ));
}
