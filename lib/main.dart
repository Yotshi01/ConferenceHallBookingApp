import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); // It ensures that everything is properly set up for your Flutter widgets and their interaction with the underlying platform, such as Android or iOS.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  EquatableConfig.stringify = kDebugMode;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final PushNotificationService _notificationService =
      PushNotificationService();

  @override
  Widget build(BuildContext context) {
    _notificationService.initialize();
    // Initializing constants screenWidth and screenHeight
    // with and height respectively of the device being used.
    // These variables are defined in constants.dart file

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (context) => BottomNavBarCubit(),
        child: MaterialApp(
          title: 'Conference Hall Booking App',
          theme: ThemeData(
            primarySwatch: Colors
                .amber, // primary theme color shown everywhere i.e. in text cursors, border colors etc.
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 241, 231,
                  195), // theme color(common color) of all appbars. Overrides the appbar color defined in appbars in different files
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 241, 231,
                  195), // theme color(common color) of all bottom navigation bar(tabbar). Overrides the tabbar color defined in tabbars in different files
            ),
          ),
          debugShowCheckedModeBanner:
              false, // making it false removes the debug banner on top right corner of app display
          home: SplashScreen(),
          // Splash Screen is the first loading screen that we see when we start the app. Here we are navigating to the SplashScreen() widget in the splash_screen.dart file
          // onGenerateRoute: CustomRouter.onGenerateRoute,
          // initialRoute: SplashScreen.routeName,
        ));
  }
}
