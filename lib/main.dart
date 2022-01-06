
import 'package:flutter/material.dart';
import 'package:new_app_test1/Screens/login_screen.dart';
import 'package:new_app_test1/Screens/my_splash_screen.dart';
import 'package:new_app_test1/Screens/registration_screen.dart';
import 'package:new_app_test1/Screens/search_screen.dart';
import 'package:new_app_test1/Screens/stall_coupons_page.dart';
import 'package:new_app_test1/Screens/offer_coupons.dart';
import 'package:new_app_test1/Screens/welcome_screen.dart';
import 'package:new_app_test1/homepage_screens/2016page.dart';
import 'package:new_app_test1/homepage_screens/2017page.dart';
import 'package:new_app_test1/homepage_screens/2018page.dart';
import 'Screens/home_page.dart';
import 'Screens/about_us.dart';
import 'Screens/executives_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String email = RegistrationScreen.emailId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: MySplashScreen.id,
      routes: {
        AboutUsPage.id: (context) => AboutUsPage(),
        HomePage.id: (context) => HomePage(),
        ExecutivesPage.id: (context) => ExecutivesPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StallCouponsPage.id: (context) => StallCouponsPage(),
        LoginScreen.id: (context) => LoginScreen(),
        OfferCoupons.id: (context) => OfferCoupons(),
        SearchScreen.id: (context) => SearchScreen(),
        MySplashScreen.id: (context) => MySplashScreen(),
        Page18.id: (context) => Page18(),
        Page17.id: (context) => Page17(),
        Page16.id: (context) => Page16(),
      },
    );
  }
}