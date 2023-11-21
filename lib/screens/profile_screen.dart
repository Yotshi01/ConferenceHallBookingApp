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

  @override
  void initState() {
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
    usernameController =
        TextEditingController(text: currentUserData?.name ?? '');
    phonenumberController =
        TextEditingController(text: currentUserData?.userContactNumber ?? '');
    toBeEditedProfileData.name = usernameController.text;
    toBeEditedProfileData.userContactNumber = phonenumberController.text;
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
                    child: Text('${currentUserData?.email ?? 'N/A'}'))

                // Column(
                //   children: [
                //     TextFormField(
                //       controller: emailidController,
                //       style: TextStyle(fontSize: 12),
                //       decoration: InputDecoration(
                //       hintText: 'xyz@abc.com',
                //       errorText: emailErrorText.isNotEmpty ? emailErrorText : null,
                //
                //       ),
                //     ),
                //   ],
                // ),
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
            // Text(
            //   'Password:',
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 16),
            // Container(padding: EdgeInsets.symmetric(
            //     horizontal: 15.0,
            //     vertical:
            //     1),
            //   width: 350,
            //   height: 50,
            //   color: Colors.grey[300],
            //   //color: const Color.fromRGBO(255, 170, 0, 0.19),
            //   // child: Column(
            //   //
            //   // ),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Handle saving changes to the username and name here
                String newUsername = usernameController.text;
                //String newemailid = emailidController.text;
                String newphonenumber = phonenumberController.text;
                //String newPassword = passwordController.text; // Corrected variable name

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
                // if (validatePassword(newPassword)) {
                //   print('Password: $newPassword');
                // } else {
                //   passwordErrorText = 'Password must be of 6 characters long including 1 capital letter, 3 small letters and 1 special character.';
                //   final snackBar = SnackBar(
                //     content: Text(passwordErrorText),
                //     backgroundColor: Colors.red,
                //     duration: Duration(seconds: 3), // Adjust the duration as needed
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }

                // if (validateEmail(newemailid)) {
                //   print('Email ID: $newemailid');
                // } else {
                //   emailErrorText = 'Please enter a valid email address';
                //   final snackBar = SnackBar(
                //     content: Text(emailErrorText),
                //     backgroundColor: Colors.red,
                //     duration: Duration(seconds: 3), // Adjust the duration as needed
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }

                // You can now update the user's profile with the new values
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
