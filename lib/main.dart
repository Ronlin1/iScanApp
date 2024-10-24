import 'package:flutter/material.dart';
import 'package:iscan/screens/splash_screen.dart';
import 'package:iscan/screens/login_screen.dart'; // Import the LoginScreen
import 'package:iscan/screens/signup_screen.dart'; // Import the SignUpScreen
import 'package:iscan/utils/constants.dart';
import 'package:iscan/screens/qr_scanner_screen.dart';
import 'package:iscan/screens/welcome_screen.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iScan',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/splash', // Set the initial route
      routes: {
        '/splash': (context) => SplashScreen(), // Define the SplashScreen route
        '/': (context) => WelcomeScreen(), // Define the WelcomeScreen route
        '/qrscanner': (context) => QRScanner(),
        '/login': (context) => LoginScreen(), // Define the LoginScreen route
        '/signup': (context) => SignUpScreen(), // Define the SignUpScreen route

        // Add more routes for other screens
      },
    );
  }
}
