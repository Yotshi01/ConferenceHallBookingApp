import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();

  final TextEditingController emailidController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  //final TextEditingController passwordController = TextEditingController();

  //String passwordErrorText = '';

  //String emailErrorText = '';

  // function that fetches api response for current logged in user details
  Future<void> _fetchCurrentUserDetailsAndInitializeTextControllers() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // we have already stored current logged in user data in
      // sharedPreferences(in login_screen.dart when the user presses the login button).
      // Now we are using the stored token foruser to get his/her user data from the database
      var obtainedToken = sharedPreferences.getString('token');
      var userData = await getCurrentUserData(
          obtainedToken!); // calling getCurrentUserData() function to make an api request to get current uer data

      setState(() {
        currentUserData =
            userData; // putting the value of fetched current user data in global variable currentUserData(defined in constants.dart file, is of type CurrentUserData which is a class in current_user_model.dart file).

        // putting the current user data in a list
        listOfCurrentUserData = [currentUserData!];

        // calling specific utility functions to return data in list format
        // to be stored in their respective global list variables. Theis
        // purposes can be infered from their naming

        // listOfMyMeetings = myMeetings();
        // listOfTodayMeetings = todayMeetings();
        // listOfMyOldMeetings = myOldMeetings();
        // listOfOtherMeetings = otherMeetings();
        usernameController =
            TextEditingController(text: currentUserData?.name ?? '');
        phonenumberController = TextEditingController(
            text: currentUserData?.userContactNumber ?? '');
        toBeEditedProfileData.name = usernameController.text;
        toBeEditedProfileData.userContactNumber = phonenumberController.text;
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  void initState() {
    _fetchCurrentUserDetailsAndInitializeTextControllers();
    super.initState();
  }

  // bool validatePassword(String password) {
  //   if (password.length < 6) {
  //     return false;
  //   }
  //   bool hasUpperCase = false;
  //   bool hasSpecialCharacter = false;
  //   for (int i = 0; i < password.length; i++) {
  //     final char = password[i];
  //     if (char == char.toUpperCase() && char != char.toLowerCase()) {
  //       hasUpperCase = true;
  //     }
  //     if ("!@#\$%^&*()_+{}[]|".contains(char)) {
  //       hasSpecialCharacter = true;
  //     }
  //   }
  //   return hasUpperCase && hasSpecialCharacter;
  // }

  // bool validateEmail(String email) {
  //   final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  //   return emailRegExp.hasMatch(email);
  // }

  @override
  Widget build(BuildContext context) {
    String firstLetter = usernameController.text.isNotEmpty
        ? usernameController.text[0].toUpperCase()
        : '';
    print('${usernameController.text} jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Edit Profile'),
        //   backgroundColor: Color.fromARGB(255, 241, 231, 195),
        // ),
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2,
          bottom: 0.1,
          left: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 40,
                child: Text(
                  firstLetter,
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Text(
            //   'Change picture',
            //   style: TextStyle(fontSize: 20, color: Colors.black),
            // ),
            // const SizedBox(height: 20),
            Text(
              'Edit Username:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1),
              width: 350,
              height: 50,
              color: Colors.grey[300],
              child: TextFormField(
                controller: usernameController,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    //hintText: 'Enter your new username',
                    ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Email ID:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1),
              width: 350,
              height: 50,
              color: Colors.amber[100],
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${currentUserData?.email ?? 'N/A'}')),
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Phone Number:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1),
              width: 350,
              height: 50,
              color: Colors.grey[300],
              child: Column(
                children: [
                  TextFormField(
                    controller: phonenumberController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle saving changes to the username and name here
                String newUsername = usernameController.text;
                //String newemailid = emailidController.text;
                String newphonenumber = phonenumberController.text;
                //String newPassword = passwordController.text; // Corrected variable name
                if (newUsername.isEmpty || newphonenumber.isEmpty) {
                  final snackBar = SnackBar(
                    content: Text('Please fill in all mandatory fields'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return; // Stop further execution if mandatory fields are empty
                }
                if (!RegExp(r'^[A-Za-z.]+$').hasMatch(newUsername) ||
                    newUsername.length > 50) {
                  final snackBar = SnackBar(
                    content: Text(
                      'Username should contain only alphabets and dots, up to 50 characters',
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return; // Stop further execution if username is invalid
                }
                if (!RegExp(r'^[0-9]{10}$').hasMatch(newphonenumber)) {
                  final snackBar = SnackBar(
                    content:
                        Text('Phone number should be a 10-digit numeric value'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return; // Stop further execution if phone number is invalid
                }
                print('Username: $newUsername');

                print('Phone Number: $newphonenumber');

                toBeEditedProfileData.id = currentUserData!.id;
                toBeEditedProfileData.name = usernameController.text;
                toBeEditedProfileData.userContactNumber =
                    phonenumberController.text;
                var response = await editProfile(toBeEditedProfileData);
                if (response.status == 'success') {
                  print('Saved Changes');
                  final snackBar = SnackBar(
                    content: Text('Changes Saved Successfully'),
                    backgroundColor: Colors.green,
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                    content: Text(
                        'Unable to save changes. Rewrite details in proper format.'),
                    backgroundColor: Colors.red,
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Save Changes'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 241, 231, 195)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
