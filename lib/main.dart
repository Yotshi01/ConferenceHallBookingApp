import 'package:conference_hall_booking/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/screens/splash_screen.dart';
import 'source/constants.dart';
// import 'package:get/get.dart';
import 'package:conference_hall_booking/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Conference Hall Booking',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 241, 231, 195),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
