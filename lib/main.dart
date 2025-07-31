import 'package:carshop/Add_Card.dart';
import 'package:carshop/Car_Detailes.dart';
import 'package:carshop/Forgot_Password.dart';
import 'package:carshop/HomePageScreen/Screens/HomePageScreen.dart';
import 'package:carshop/HomePageScreen/Widgets/CarCard.dart';
import 'package:carshop/Loginscreen.dart';
import 'package:carshop/My_Profile.dart';
import 'package:carshop/OnBoardingScreen.dart';
import 'package:carshop/Register.dart';
import 'package:carshop/Scan_Card.dart';
import 'package:carshop/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splash.Routename:(_)=>splash(),
        Onboardingscreen.routName:(_)=>Onboardingscreen(),
        LoginScreen.routename:(context)=>LoginScreen(),
        ForgotPassword.routename:(context)=>ForgotPassword(),
        Register.routename:(_)=>Register(),
        HomePageScreen.routename:(_)=>HomePageScreen(),
        CarDetails.routeName:(_)=>CarDetails(),
        Profile.routeName:(_)=>Profile(),
        AddCard.routeName:(_)=>AddCard(),
        ScanCard.routeName:(_)=>ScanCard(),
      },
      initialRoute: splash.Routename,
    );
  }
}