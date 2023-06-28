import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/login_screen.dart';
import 'auth/register_screen.dart';
import 'constant/constant.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _image(),
                _title("Discover Your\nDream Course Here"),
                _subTitle(
                    "Find the best course for you here\nthere are a lot of best quality course around the world"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _login('Sign In'),
                  _register('Sign Up'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // <----------------- Widgets ----------------->
  // image widget
  Widget _image() {
    return Image.asset(
      "assets/welcome.jpg",
      fit: BoxFit.cover,
    );
  }

  // title widget
  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: black,
        ),
      ),
    );
  }

  // subtitle widget
  Widget _subTitle(String subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        subTitle,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black45,
        ),
      ),
    );
  }

  // button widget
  Widget _login(String signIn) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: blue,
        onPrimary: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: Size(170, 70),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          builder: (BuildContext context) {
            return const LoginScreen();
          },
        );
      },
      child: Text(signIn),
    );
  }

  // register widget
  Widget _register(String signUp) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: Size(170, 70),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          builder: (BuildContext context) {
            return const RegisterScreen();
          },
        );
      },
      child: Text(
        signUp,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
