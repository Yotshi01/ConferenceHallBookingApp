import 'package:flutter/material.dart';
import 'package:conference_hall_booking/screens/start_screen.dart';
import 'constants.dart';

void main() {
  // Get the screen size and set the global variables
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure WidgetsBinding is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Conference Hall Booking',

      theme: ThemeData(
        primarySwatch: Colors.amber,

        // textSelectionTheme: TextSelectionThemeData(
        //   cursorColor: Colors.white, //<-- SEE HERE
        // ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 241, 231, 195),
          elevation: 0, // Remove the shadow
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
      // home: HomeScreen(),
    );
  }
}
