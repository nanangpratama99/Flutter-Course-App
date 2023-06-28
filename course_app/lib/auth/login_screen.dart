import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import '../main_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              height: 8,
              width: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 209, 209),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                _text("Helo Adam",
                    fontSize: 30, color: black, fontWeight: FontWeight.w600),
                _text("Welcome Back",
                    color: black.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
                _text("Please login for Continue !",
                    color: black.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 15),

                // form
                _form(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ======================= WIDGET ==========================
  // title
  Widget _text(String nama,
      {required double fontSize,
      required Color color,
      required FontWeight fontWeight}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        nama,
        style: GoogleFonts.roboto(
            fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
    );
  }

  // form
  Widget _form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _emailField("Email or Phone Number", "user@gmail.com", Icons.email),
            _passwordField(
                "Input Password", "Password", Icons.key, Icons.remove_red_eye),
            _loginButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("Forgor Pass"),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
            _text(
              "Or connect with",
              color: black.withOpacity(0.5),
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            _listAccount(),
          ],
        ),
      ),
    );
  }

  // email textfile
  Widget _emailField(String label, String hint, IconData prefix) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          label: Text(label),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(prefix),
          filled: false),
      autofocus: true,
      // focusNode: FocusNode(),
    );
  }

  // email textfile
  Widget _passwordField(
      String label, String hint, IconData prefix, IconData sufix) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          label: Text(label),
          hintText: hint,
          prefixIcon: Icon(prefix),
          suffixIcon: Icon(sufix),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        autofocus: true,
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: green,
          onPrimary: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width, 70),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainMenu(),
          ),
        ),
        child: Text('Login'),
      ),
    );
  }

  // akun
  Widget _account(String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        imagePath,
        width: 25,
      ),
    );
  }

  Widget _listAccount() {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _account("assets/facebook.png"),
          _account("assets/google.png"),
          _account("assets/apple.png"),
        ],
      ),
    );
  }
}
