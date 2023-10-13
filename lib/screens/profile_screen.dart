import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailidController = TextEditingController();

  final TextEditingController phonenumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String passwordErrorText = '';

  String emailErrorText = '';

  bool validatePassword(String password) {
    if (password.length < 6) {
      return false;
    }
    bool hasUpperCase = false;
    bool hasSpecialCharacter = false;
    for (int i = 0; i < password.length; i++) {
      final char = password[i];
      if (char == char.toUpperCase() && char != char.toLowerCase()) {
        hasUpperCase = true;
      }
      if ("!@#\$%^&*()_+{}[]|".contains(char)) {
        hasSpecialCharacter = true;
      }
    }
    return hasUpperCase && hasSpecialCharacter;
  }

  bool validateEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromARGB(255, 241, 231, 195),
      ),
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
            Row(
            children:[
               Icon(Icons.account_circle_rounded,
                  size: 100, color: Colors.black26),
              SizedBox(width:15),
              Align(
                alignment: Alignment.topLeft,
                child:Text('Add optional profile picture.')
              )
            ]
            ),
            
            
           
              const SizedBox(width: 10),
            Text(
                  'Change picture',
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                ),
            const SizedBox(height: 20),
            Text(
              'Edit Username:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical:
                1),
              width: 350,
              height: 50,
              color: Colors.grey[300],
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Enter your new username',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Email ID:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical:
                1),
              width: 350,
              height: 50,
              color:Colors.grey[300],
              child: Column(
                children: [
                  TextFormField(
                    controller: emailidController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                    hintText: 'xyz@abc.com',
                    errorText: emailErrorText.isNotEmpty ? emailErrorText : null,

                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Edit Phone Number:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical:
                1),
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
            Text(
              'Edit Password:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical:
                1),
              width: 350,
              height: 50,
              color: Colors.grey[300],
              //color: const Color.fromRGBO(255, 170, 0, 0.19),
              child: Column(
                children: [
                  TextFormField(
                    controller: passwordController,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Enter new password',
                      errorText: passwordErrorText.isNotEmpty ? passwordErrorText : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle saving changes to the username and name here
                String newUsername = usernameController.text;
                String newemailid = emailidController.text;
                String newphonenumber = phonenumberController.text;
                String newPassword = passwordController.text; // Corrected variable name

                print('Username: $newUsername');
                
                print('Phone Number: $newphonenumber');

                if (validatePassword(newPassword)) {
                  print('Password: $newPassword');
                } else {
                  passwordErrorText = 'Password must be of 6 characters long including 1 capital letter, 3 small letters and 1 special character.';
                  final snackBar = SnackBar(
                    content: Text(passwordErrorText),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                
                if (validateEmail(newemailid)) {
                  print('Email ID: $newemailid');
                } else {
                  emailErrorText = 'Please enter a valid email address';
                  final snackBar = SnackBar(
                    content: Text(emailErrorText),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3), // Adjust the duration as needed
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                // You can now update the user's profile with the new values
              },
              child: Text('Save Changes'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 241, 231, 195)),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
