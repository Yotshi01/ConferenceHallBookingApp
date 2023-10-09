import 'package:conference_hall_booking/source/common_packages_export.dart';
import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/screens/home_screen.dart';
import 'package:conference_hall_booking/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => finalEmail == null
                      ? const LoginScreen()
                      : const HomeScreen())));
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    var obtainedToken = sharedPreferences.getString('token');
    setState(() {
      finalEmail = obtainedEmail;
      finalToken = obtainedToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0,
                  screenHeight * 0.2,
                  screenWidth * 0,
                  screenHeight * 0.08,
                ),
                child: Image.asset(
                  "assets/images/booking.png",
                  width: screenWidth * 0.7,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
