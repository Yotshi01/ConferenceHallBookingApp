import 'package:flutter/material.dart';
import 'package:conference_hall_booking/navigation_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerFile(),
    appBar: AppBar(
      title: const Text('Setting'),
      backgroundColor: Colors.amber,
  ),
  );

}