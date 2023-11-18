// import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class TabbarSetup extends StatefulWidget {
  const TabbarSetup({super.key});

  @override
  State<TabbarSetup> createState() => _TabbarSetupState();
}

class _TabbarSetupState extends State<TabbarSetup> {
  int _selectedIndex =
      1; // this is the variable(storing index) by which we will refer to the tabbar content in list using index
  // initially it is set to 1 i.e. for homescreen, 0 is for notifications page and 2 is for schedule page

  final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();

  String _appBarTitle = 'Welcome';

  bool get hasNotification => true; // Add a variable to hold the app bar text

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex =
          index; //sets the index of the to be displayed content in tabbar to the index of the content page

      //Update the app bar text based on the selected tab
      _appBarTitle = _getAppBarTitle(index);
    });
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Profile';
      case 1:
        return 'Home';
      case 2:
        return 'Schedule';
      default:
        return 'Welcome';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // tabs
      ProfileScreen(),
      Builder(
        builder: (context) => Navigator(
          key: homeTabNavigatorKey,
          onGenerateRoute: (settings) {
            // You can set up custom routes and transitions here if needed.
            return MaterialPageRoute(builder: (context) => HomeScreen());
          },
        ),
      ),
      // HomeScreen(),
      const SyncfusionCalendar(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // drawer: NavigationDrawerFile(),
      // drawerScrimColor: Colors.transparent,
      appBar: reusableAppBar(_appBarTitle, context, hasNotification),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), label: 'Schedule'),
          ]),
    );
  }
}
