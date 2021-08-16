//@dart=2.9

import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:movielist/Add.dart';
import 'package:movielist/home_page.dart';
import 'package:movielist/login_page.dart';
import 'package:movielist/widgets/theme.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  // final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        routes: {
          "/" : (context) => HomePage(),
          "/login": (context) => LoginPage(),
          "/Add" : (context) => AddMovie()
        },
      );
    }
}