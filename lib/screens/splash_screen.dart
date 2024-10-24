import 'package:flutter/material.dart';
import 'package:iscan/utils/constants.dart'; // Import SvgPicture from flutter_svg package
import 'package:iscan/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image.asset(
          "assets/images/iscan.png", // Update the path to your PNG image
          height: 350.0,
        ),
      ),
    );
  }
}
