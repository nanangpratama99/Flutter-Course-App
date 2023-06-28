import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                _text("Welcome",
                    fontSize: 30, color: black, fontWeight: FontWeight.w600),
                _text("Please register to make an account",
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
            _emailField("Email or Phone number", "user@gmail.com", Icons.email),
            _passwordField(
                "Input Password", "Password", Icons.key, Icons.remove_red_eye),
            _confirPassField("Repeat Password", "Confirm Password", Icons.key,
                Icons.remove_red_eye),
            _loginButton(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Already have an account",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
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

  // password textfile
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

  // confirm pass textfile
  Widget _confirPassField(
      String label, String hint, IconData prefix, IconData sufix) {
    return TextFormField(
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
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 40),
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
        onPressed: () {},
        child: Text('Register'),
      ),
    );
  }
}
