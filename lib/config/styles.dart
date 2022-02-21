import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const chartLabelsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static const tabTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle judulHalaman = GoogleFonts.poppins(
    color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700);

TextStyle sidebar = GoogleFonts.poppins(
    color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);

TextStyle textHitam = GoogleFonts.poppins(
    color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600);

TextStyle dataRs = GoogleFonts.poppins(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);

TextStyle dataRsPerKota = GoogleFonts.poppins(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

TextStyle detailRS = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w200,
    fontStyle: FontStyle.italic);

TextStyle isiDetailRS = GoogleFonts.poppins(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

TextStyle beritaStyle = GoogleFonts.poppins(
    color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400);

TextStyle publishat = GoogleFonts.poppins(
    color: Colors.black, fontSize: 10, fontWeight: FontWeight.w300);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';
