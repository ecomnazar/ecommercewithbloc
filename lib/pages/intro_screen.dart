import 'package:finalapp/pages/bottom_nav_bar.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/shop_screen.dart';
import 'package:finalapp/static/screen_size.dart';
import 'package:finalapp/static/static_colors.dart';
import 'package:finalapp/static/static_fonts.dart';
import 'package:finalapp/widgets/big_button_widget.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenSize().getWidth(context),
        height: ScreenSize().getHeight(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/intro_image.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Boldtext(
                size: 43,
                text: 'Welcome\nto out store',
                textColor: Pallete.whiteColor,
                textAlign: true),
            const Regulartext(
                size: 13,
                text: 'Get your groceries in as fast as one hour',
                textColor: Pallete.whiteColor,
                textAlign: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: BigButtonWidget(buttonText: 'Get Started', callBack: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}