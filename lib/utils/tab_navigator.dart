import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavBarItem item;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
        key: navigatorKey,
        initialRoute: tabNavigatorRoot,
        onGenerateInitialRoutes: (_, initialRoute) {
          return [
            MaterialPageRoute(
              builder: (context) => routeBuilders[initialRoute]!(context),
            )
          ];
        });
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavBarItem item) {
    switch (item) {
      case BottomNavBarItem.profile:
        return ProfileScreen();
      // return Container();
      case BottomNavBarItem.home:
        return HomeScreen(key: homeScreenKey);
      case BottomNavBarItem.booking:
        return SyncfusionCalendar();
      default:
        return Scaffold();
    }
  }
}
