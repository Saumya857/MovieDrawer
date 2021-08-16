import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primaryColorDark: Colors.red[400],
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.red[400]),
      textTheme: Theme.of(context).textTheme,
    ));
    static ThemeData darkTheme(BuildContext context) => ThemeData(
      primaryColorDark: Colors.red[900],
      appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.red[400]),
      textTheme: Theme.of(context).textTheme,
      ),

    );
}