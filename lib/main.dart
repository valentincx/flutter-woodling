import 'package:flutter/material.dart';
import 'package:woodling/routes.dart';
//import 'package:woodling/screens/home/home_screen.dart';
import 'package:woodling/screens/splash/splash_screen.dart';
import 'package:woodling/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woodling',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      //initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
