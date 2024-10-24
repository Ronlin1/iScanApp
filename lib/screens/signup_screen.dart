import 'package:flutter/material.dart';
import 'package:iscan/components/already_have_an_account_check.dart';
import 'package:iscan/components/or_divider.dart';
import 'package:iscan/components/rounded_button.dart';
import 'package:iscan/components/rounded_input_field.dart';
import 'package:iscan/components/rounded_password_field.dart';
import 'package:iscan/components/social_icon.dart';
import 'package:iscan/screens/login_screen.dart';
import 'package:iscan/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iscan/utils/auth_service.dart';
import 'package:iscan/screens/qr_scanner_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password = "";
  String? _email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/signup_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.23,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        foreground: Paint()..shader = linearGradient),
                  ),
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    "assets/images/signup.svg",
                    height: size.height * 0.25,
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RoundedInputField(
                          hintText: "Your Email",
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (_email == null || _email!.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!isValidEmail(_email!)) {
                              return "Invalid email format";
                            }
                            return null;
                          },
                        ),
                        RoundedPasswordField(
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  RoundedButton(
                    text: "SIGN UP",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Call the authService to register
                        bool registrationSuccessful =
                            await AuthService.signUp(_email!, _password);

                        if (registrationSuccessful) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRScanner()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Registration failed!")));
                          // Handle registration failure (show an error message, etc.)
                        }
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    login: false,
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocialIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }
}
