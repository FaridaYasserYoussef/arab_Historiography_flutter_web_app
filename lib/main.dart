import 'package:flutter/material.dart';
// import 'package:trial_flutter_web_app/HomePage.dart';
import 'package:trial_flutter_web_app/HomePage.dart';
import 'package:trial_flutter_web_app/Screens/bookDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    
      routes: {
       HomePage.routeName :(context) => HomePage(),
      //  BookDetailsScreen.routeName :(context) => BookDetailsScreen()
      },
    );
  }
}
