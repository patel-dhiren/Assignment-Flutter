import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login/login_screen.dart';
import 'package:flutter_project/screens/onboarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.red.shade300,
                Colors.red.shade200,
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/app_logo.png',
                height: 140,
                width: 140,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
