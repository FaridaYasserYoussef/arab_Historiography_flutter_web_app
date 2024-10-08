import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:trial_flutter_web_app/HomePage.dart';
import 'package:trial_flutter_web_app/HomePage.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/Screens/AISearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/allBooksSearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/singleBookSearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/timeSearchScreen.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (_)=> SearchResultsProvider(),
    child: MyApp(),
    ));
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
       SingleBookSearchScreen.routeName : (context) => SingleBookSearchScreen(),
       AllBooksSearchScreen.routeName : (context) => AllBooksSearchScreen(),
       AISearchScreen.routeName:(context) => AISearchScreen(),
       TimeSearchScreen.routeName :(context) => TimeSearchScreen()
      },
    );
  }
}
