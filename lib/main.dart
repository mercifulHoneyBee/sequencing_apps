import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'jua',
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
        ),
        bodyText2: TextStyle(

        ),
      ),
    ),
    home: HomeScreen(),
  ));
}
