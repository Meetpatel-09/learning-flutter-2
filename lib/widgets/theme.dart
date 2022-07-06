import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        textTheme: Theme.of(context).textTheme,
        cardColor: Colors.black,
        canvasColor: Colors.white,
        backgroundColor: creamColor,
        primaryColor: darkBluishColor,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: Theme.of(context).textTheme,
        cardColor: Colors.white,
        canvasColor: Colors.black,
        backgroundColor: darkCreamColor,
        primaryColor: ligthBluishColor,
      );

  static Color creamColor = const Color(0xfff5f5f5); //
  static Color darkCreamColor = Vx.gray800; //

  static Color darkBluishColor = const Color(0xff000080); //
  static Color ligthBluishColor = Vx.indigo500; //
}
