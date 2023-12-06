import 'package:conference_hall_booking/source/exported_packages_for_easy_imports.dart';
import 'package:conference_hall_booking/source/constants.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.black, size: screenWidth * 0.07),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.50,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color(0xFFD7D0D0),
        ),
      ),
      // hintText: text,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

ElevatedButton bookNow(BuildContext context) {
  BuildContext currentContext = context;
  return ElevatedButton(
    onPressed: () async {
      // Add your book now functionality here
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => BookNow()));
      // print("Book Now Button clicked");

      try {
        // Navigator.push(
        //     currentContext,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             SyncfusionCalendar(bookingDetails: response.data!)));

        Navigator.push(
            currentContext,
            MaterialPageRoute(
                builder: (context) => const SyncfusionCalendar()));
      } catch (e) {
        // print("Error: $e");
        throw Exception("Error: $e");
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      elevation: 4,
    ),
    child: Container(
      width: screenWidth * 0.5,
      height: screenHeight * 0.06,
      decoration: const BoxDecoration(
        color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            // blurRadius: 4,
            // offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          "Book Now",
          style: TextStyle(
            color: Colors.black87, // You can set your text color here
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

AppBar reusableAppBar(
    String pageName, BuildContext context, bool hasNotification) {
  return AppBar(
    elevation: 5,
    // flexibleSpace: Container(),
    centerTitle: true,
    title: Text(
      pageName,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 1.25,
        letterSpacing: 0.16,
      ),
    ),

    // leading: IconButton(
    //   icon: Icon(
    //     Icons.logout,
    //     color: Colors.black,
    //   ),
    //   onPressed: () {
    //     _showLogoutConfirmationDialog(context);

    //     // Navigator.push(context,
    //     //     MaterialPageRoute(builder: (context) => NotificationsScreen()));
    //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     //   builder: (context) => const LoginScreen(),
    //     // ));
    //     // final SharedPreferences sharedPreferences =
    //     //     await SharedPreferences.getInstance();
    //     // sharedPreferences.remove('email');
    //     // sharedPreferences.remove('token');
    //     // Navigator.pushReplacement(
    //     //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    //   },
    // ),
    // backgroundColor: const Color(0xFF048B3F),
    actions: <Widget>[
      Stack(
        children: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Dialog(
              //       // Your notification UI here
              //       child: NotificationsScreen(),
              //     );
              //   },
              // ).then((value) {
              //   // This block of code will be executed after the dialog is dismissed
              //   print('Dialog closed');
              // });

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => NotificationsScreen(),
              // ));
            },
          ),
          if (hasNotification)
            Positioned(
                top: 5,
                right: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                )),
        ],
      )
    ],
  );
}

// void _showLogoutConfirmationDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Logout'),
//         content: Text('Are you sure you want to logout?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text('No'),
//           ),
//           TextButton(
//             onPressed: () async {
//               final SharedPreferences sharedPreferences =
//                   await SharedPreferences.getInstance();
//               sharedPreferences.remove('email');
//               sharedPreferences.remove('token');
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//             child: Text('Yes'),
//           ),
//         ],
//       );
//     },
//   );
// }
