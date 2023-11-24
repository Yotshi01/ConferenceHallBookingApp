import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<SplashScreen> {
  // initState() function executes only once i.e. when its file(here splash_screen.dart) gets executed for the first time for every time we come in this page in the app)
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 0),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      // if finalEmail has a null value i.e. user has not yet logged in then we navigate to to
                      // the login page otherwise we go to the homescreen(here homescreen is inside tabs of
                      // tabbar so we navigate to tabbar setup screen and then to a screen according to the
                      // selected tab)
                      finalEmail == null
                          ? const LoginScreen()
                          : BlocProvider<BottomNavBarCubit>(
                              create: (_) => BottomNavBarCubit(),
                              child: TabbarSetup(),
                            ))));
    });
    super.initState();
  }

  Future getValidationData() async {
    // SharedPreferences used for storing the current session of a user that has logged in so that logged in users donot have to login again and again untill the logout on their account.
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // sharedPreference will have stored email and token from the last
    // login here we initialize obtainedEmail and obtainedToken with
    // them and see whether the user has logged out or still logged in
    // before showing him/her tabbar setup screen
    var obtainedEmail = sharedPreferences.getString('email');
    var obtainedToken = sharedPreferences.getString('token');
    setState(() {
      // storing email and generated ttoken of user in finalEmail and
      // finalToken respectively
      finalEmail = obtainedEmail;
      finalToken = obtainedToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:
            screenHeight, // giving container the height of the device screen currently being used
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
