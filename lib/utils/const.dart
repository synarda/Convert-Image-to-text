import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle get smallTextStyle => GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get mediumTextStyle => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get bigTextStyle => GoogleFonts.montserrat(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get smallTitleStyle => GoogleFonts.montserrat(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: Colorss.textColor,
      );
  static TextStyle get bigTitleStyle => GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colorss.textColor,
      );
}

class Colorss {
  static const backgroundColor = Color(0xff272833);
  static const forebackground = Color(0xff0D0C0C);
  static const themeNeon1 = Color(0xff005E95);
  static const textColor = Color(0xffafaeb6);
}
