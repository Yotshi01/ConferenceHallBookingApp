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
  // initially it is set to 1 i.e. for homescreen, 0 is for notifications page and 2 is for booking page

  final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> bookingTabNavigatorKey =
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
        return 'Booking';
      default:
        return 'Welcome';
    }
  }

  final Map<BottomNavBarItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavBarItem.profile: GlobalKey<NavigatorState>(),
    BottomNavBarItem.home: GlobalKey<NavigatorState>(),
    BottomNavBarItem.booking: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavBarItem, IconData> items = const {
    BottomNavBarItem.profile: Icons.account_circle_rounded,
    BottomNavBarItem.home: Icons.home,
    BottomNavBarItem.booking: Icons.add_box_rounded,
  };

  // @override
  // void initState() {
  //   super.initState();

  //   // Set the initial state of the BottomNavBarCubit
  //   context.read<BottomNavBarCubit>().updateSelectedItem(BottomNavBarItem.home);
  // }

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

      Builder(
        builder: (context) => Navigator(
          key: bookingTabNavigatorKey,
          onGenerateRoute: (settings) {
            // You can set up custom routes and transitions here if needed.
            return MaterialPageRoute(
                builder: (context) => SyncfusionCalendar());
          },
        ),
      ),
      // const SyncfusionCalendar(),
    ];
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          // drawer: NavigationDrawerFile(),
          // drawerScrimColor: Colors.transparent,
          appBar: reusableAppBar(_appBarTitle, context, hasNotification),
          ////// body: _pages[_selectedIndex],
          body: Stack(
            children: items
                .map((item, _) => MapEntry(
                      item,
                      _buildOffstageNavigator(item, item == state.selectedItem),
                    ))
                .values
                .toList(),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //     selectedItemColor: Colors.orange,
          //     unselectedItemColor: Colors.grey,
          //     currentIndex: _selectedIndex,
          //     onTap: _navigateBottomBar,
          //     items: const [
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.book_rounded), label: 'Booking'),
          //     ]),

          bottomNavigationBar: BottomNavBar(
            items: items,
            selectedItem: state.selectedItem,
            onTap: (index) {
              final selectedItem = BottomNavBarItem.values[index];

              _selectBottomNavBarItem(
                  context, selectedItem, selectedItem == state.selectedItem);
            },
          ));
    });
  }

  void _selectBottomNavBarItem(
      BuildContext context, BottomNavBarItem selectedItem, bool isSameItem) {
    if (isSameItem) {
      navigatorKeys[selectedItem]!
          .currentState!
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
    BottomNavBarItem currentItem,
    bool isSelected,
  ) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}
