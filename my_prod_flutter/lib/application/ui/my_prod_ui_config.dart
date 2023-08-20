import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProdUiConfig {
  MyProdUiConfig._();

  static String get title => 'My Prod - A casa do artista musical';

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.openSansTextTheme(),
      );
}
