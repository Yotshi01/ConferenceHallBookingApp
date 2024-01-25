import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class InitialSplashScreen extends StatefulWidget {
  const InitialSplashScreen({super.key});

  @override
  State<InitialSplashScreen> createState() => _InitialSplashScreenState();
}

class _InitialSplashScreenState extends State<InitialSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
                  "assets/images/logo_big.png",
                  width: screenWidth * 0.7,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.yellow,
                    size: screenWidth * 0.15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.2,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color(0xFF636060),
                        fontSize: 25,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'Baithak',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' a Meeting App \n Now create a meeting in few minutes using \n ',
                        ),
                        TextSpan(
                          text: 'Baithak Application',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
