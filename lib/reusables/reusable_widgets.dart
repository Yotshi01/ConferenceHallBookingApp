import 'package:conference_hall_booking/api/booking_details_api.dart';
import 'package:conference_hall_booking/constants.dart';
import 'package:conference_hall_booking/screens/book_now_screen.dart';
import 'package:flutter/material.dart';
import 'package:conference_hall_booking/screens/syncfusion_calendar.dart';

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
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: UnderlineInputBorder(
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
      print("Book Now Button clicked");

      try {
        // Navigator.push(
        //     currentContext,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             SyncfusionCalendar(bookingDetails: response.data!)));

        Navigator.push(currentContext,
            MaterialPageRoute(builder: (context) => SyncfusionCalendar()));
      } catch (e) {
        print("Error: $e");
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFFC304),
      elevation: 4,
    ),
    child: Container(
      width: screenWidth * 0.5,
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
        color: Color(0xFFFFC304),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            // blurRadius: 4,
            // offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Book Now",
          style: TextStyle(
            color: Colors.black, // You can set your text color here
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
