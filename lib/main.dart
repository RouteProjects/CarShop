import 'package:carshop/Forgot_Password.dart';
import 'package:carshop/Loginscreen.dart';
import 'package:carshop/Register.dart';
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
        LoginScreen.routename:(context)=>LoginScreen(),
        ForgotPassword.routename:(context)=>ForgotPassword(),
        Register.routename:(_)=>Register(),
      },
      initialRoute: LoginScreen.routename,
    );
  }
}