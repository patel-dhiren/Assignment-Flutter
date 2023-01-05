import 'package:flutter/material.dart';
import 'package:flutter_project/screens/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      home: SplashScreen(),
    );
  }
}

