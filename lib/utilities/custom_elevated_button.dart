import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton {
  ElevatedButton buildElevatedButtonForAnswer(
      Function() function, String text) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        text,
        style: GoogleFonts.abel(),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: StadiumBorder()),
    );
  }
}
