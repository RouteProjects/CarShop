import 'package:carshop/Loginscreen.dart';
import 'package:carshop/OnBoardingScreen.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  static const String Routename = "splash";
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Onboardingscreen.routName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset("Assets/images/BG.png", fit: BoxFit.cover),
          ),
          Center(
            child: SizedBox(
              width: 250,
              height: 100,
              child: Image.asset("Assets/images/Full Logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
