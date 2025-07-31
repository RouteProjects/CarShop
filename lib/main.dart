import 'package:carshop/Add_Card.dart';
import 'package:carshop/Car_Detailes.dart';
import 'package:carshop/Forgot_Password.dart';
import 'package:carshop/HomePageScreen/Screens/HomePageScreen.dart';
import 'package:carshop/Loginscreen.dart';
import 'package:carshop/Register.dart';
import 'package:carshop/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splash.routename:(_)=>splash(),
        LoginScreen.routename:(context)=>LoginScreen(),
        ForgotPassword.routename:(context)=>ForgotPassword(),
        Register.routename:(_)=>Register(),
        HomePageScreen.routename:(_)=>HomePageScreen(),
        CarDetails.routename:(_)=>CarDetails(),
        AddCard.routename:(_)=>AddCard(),
      },
      initialRoute: splash.routename,
    );
  }
}