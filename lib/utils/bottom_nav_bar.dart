import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class BottomNavBar extends StatelessWidget {
  final Map<BottomNavBarItem, IconData> items;
  final BottomNavBarItem selectedItem;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: BottomNavBarItem.values.indexOf(selectedItem),
      items: items
          .map((item, icon) => MapEntry(
                item.toString(),
                BottomNavigationBarItem(
                  label: _getLabel(item),
                  icon: Icon(icon, size: 30.0),
                ),
              ))
          .values
          .toList(),
    );
  }

  String _getLabel(BottomNavBarItem item) {
    // Add labels for each BottomNavBarItem as needed
    switch (item) {
      case BottomNavBarItem.profile:
        return 'Profile';
      case BottomNavBarItem.home:
        return 'Home';
      case BottomNavBarItem.booking:
        return 'Booking';
      default:
        return '';
    }
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
