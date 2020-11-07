import 'package:bookario/components/bottom_navbar.dart';
import 'package:bookario/models/History.dart';
import 'package:bookario/screens/history/booking_history.dart';
import 'package:bookario/screens/home/home_screen.dart';
import 'package:bookario/screens/sign_in/sign_in_screen.dart';
import 'package:bookario/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookario/routes.dart';
import 'package:bookario/screens/splash/splash_screen.dart';
import 'package:bookario/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookario',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      // initialRoute: SplashScreen.routeName,
      initialRoute: BottomCustomNavBar.routeName,
      // initialRoute: HomeScreen.routeName,
      // initialRoute: Tabs.routeName,
      routes: routes,
    );
  }
}
