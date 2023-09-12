import 'package:conference_hall_booking/constants.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/screens/login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: null),
          Center(
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
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: CircleBorder(),
                    elevation: 4,
                    backgroundColor: Colors.white,
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double buttonSize =
                          constraints.maxWidth * 0.2; // Adjust as needed

                      return SizedBox(
                        width: buttonSize,
                        height: buttonSize,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: buttonSize,
                                height: buttonSize,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.yellow,
                                size: buttonSize *
                                    0.9, // Adjust the size as needed
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.2,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF636060),
                          fontSize: 25,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
