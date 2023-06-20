import 'dart:async';

import 'package:finalapp/pages/intro_screen.dart';
import 'package:finalapp/static/static_colors.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Boldtext(size: 45, text: 'seven market', textColor: Pallete.whiteColor),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Pallete.whiteColor)
          ],
        ),
      ),
    );
  }
}

