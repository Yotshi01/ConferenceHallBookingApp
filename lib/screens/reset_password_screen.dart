import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailVerificationTextController =
      TextEditingController();
  bool messageSentToEmail = false;
  late ForgotPasswordResponse response;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: null),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0,
                      screenHeight * 0.15,
                      screenWidth * 0,
                      screenHeight * 0.03,
                    ),
                    child: Image.asset(
                      "assets/images/logo_big.png",
                      width: screenWidth * 0.7,
                    ),
                  ),
                  Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.4,
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
                      child: SingleChildScrollView(
                          child: (messageSentToEmail == false)
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    const Text(
                                      'Forgot Password',
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
                                      child: reusableTextField(
                                          "Enter your email id",
                                          Icons.person,
                                          false,
                                          _emailVerificationTextController),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    if (!isLoading)
                                      ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          // reset password api call logic
                                          response = await sendRequest(
                                              _emailVerificationTextController
                                                  .text);

                                          setState(() {
                                            isLoading = false;
                                          });

                                          if (response.success == true) {
                                            setState(() {
                                              messageSentToEmail = true;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                    "Mail sent successfully!"),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                // backgroundColor: Colors.green,
                                                content:
                                                    Text("${response.message}"),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFFB500),
                                          elevation: 4,
                                          shadowColor: const Color(0x3F000000),
                                          minimumSize: const Size(172, 41),
                                        ),
                                        child: const Text(
                                          'Send',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    else
                                      const CircularProgressIndicator(),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    const Text(
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
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: screenHeight * 0.1),
                                    Text(
                                      '${response.message}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF726F6B),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.1),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                    'Did not recieve mail?'),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      messageSentToEmail =
                                                          false;
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFFB500),
                                                    elevation: 4,
                                                    shadowColor:
                                                        const Color(0x3F000000),
                                                    minimumSize: Size(
                                                        screenWidth * 0.2,
                                                        screenHeight * 0.05),
                                                  ),
                                                  child: const Text(
                                                    'Resend',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )))
                                  ],
                                )))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Remembered your password?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Text(
            " Log In",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
