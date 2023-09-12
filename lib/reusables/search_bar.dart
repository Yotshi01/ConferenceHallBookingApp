import 'package:conference_hall_booking/constants.dart';
import 'package:flutter/material.dart';

TextField reusableSearchBar() {
  return TextField(
    // controller: controller,

    enableSuggestions: true,
    autocorrect: true,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon:
          Icon(Icons.search, color: Colors.black, size: screenWidth * 0.07),
      labelText: 'Search here...',
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      // suffixIcon: Icon(Icons.search),
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.50,
          // strokeAlign: BorderSide.strokeAlignCenter,
          color: Colors.white,
        ),
      ),
      // hintText: text,
    ),
  );
}
