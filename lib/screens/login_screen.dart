import 'package:conference_hall_booking/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/constants.dart';
import 'package:conference_hall_booking/reusables/reusable_widgets.dart';
import 'package:conference_hall_booking/screens/signup_screen.dart';
import 'package:conference_hall_booking/screens/reset_password_screen.dart';
import 'package:conference_hall_booking/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

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
                    screenHeight * 0.07,
                    screenWidth * 0,
                    screenHeight * 0.03,
                  ),
                  child: Image.asset(
                    "assets/images/booking.png",
                    width: screenWidth * 0.7,
                  ),
                ),
                Container(
                  width: 333,
                  height: 396,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF726F6B),
                            fontSize: 20,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: reusableTextField("Enter Your Username",
                              Icons.person, false, _emailTextController),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: reusableTextField("Enter Your Password",
                              Icons.lock, true, _passwordTextController),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          child: forgetPassword(context),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your login logic here
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFB500),
                            elevation: 4,
                            shadowColor: Color(0x3F000000),
                            minimumSize: Size(172, 41),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Color(0xFFABA2A2),
                            fontSize: 10,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        signUpOption()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResetPasswordScreen())),
      ),
    );
  }
}
