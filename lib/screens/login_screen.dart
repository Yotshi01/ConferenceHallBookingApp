import 'package:conference_hall_booking/source/constants.dart';
import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // CurrentUserData toBeAddedFirebaseToken = CurrentUserData();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool _obscureText = true;
  //bool _obscuredText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Container(
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
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.5,
                  decoration: const BoxDecoration(
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF726F6B),
                          fontSize: 20,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: screenHeight * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _emailTextController,
                              //obscureText: _obscuredText,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    //   //_obscuredText = !_obscuredText;
                                    // }
                                    //);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //   reusableTextField("Enter Your Username",
                      //       Icons.person, false, _emailTextController),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: screenHeight * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _passwordTextController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // reusableTextField("Enter Your Password",
                      //     Icons.lock, true, _passwordTextController),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06,
                          // vertical: screenHeight * 0.01
                        ),
                        child: forgetPassword(context),
                      ),

                      SizedBox(
                        height: screenHeight * 0.03,
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          print("Login Button clicked");
                          try {
                            print(
                                '${_emailTextController.text} ${_passwordTextController.text} lxcnvcvklcxv');
                            final response = await userLogin(
                              _emailTextController.text,
                              _passwordTextController.text,
                            );

                            print('dcnkdcacax');
                            if (response.success == false) {
                              print("Login Error: An error occurred.");
                              Fluttertoast.showToast(
                                  msg:
                                      'Please provide correct login credentials!',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  // timeInSecForIos: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.yellow);
                            } else {
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  'email', _emailTextController.text);

                              sharedPreferences.setString(
                                  'token', response.data!.token!);

                              print('sdcacasnksxmxxm Xz');

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TabbarSetup()));
                            }
                          } catch (e) {
                            print("Error: $e");
                          }
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
                      //us
                      //signUpOption()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Row signUpOption() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text("Don't have account?",
  //           style: TextStyle(color: Colors.black)),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignupScreen()));
  //         },
  //         child: const Text(
  //           " Sign Up",
  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  //         ),
  //       )
  //     ],
  //   );
  // }

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
