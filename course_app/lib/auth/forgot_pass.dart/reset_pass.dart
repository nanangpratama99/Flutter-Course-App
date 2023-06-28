import 'package:course_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    const SizedBox gap = SizedBox(height: 10);
    const SizedBox gap2 = SizedBox(height: 20);
    const SizedBox gap3 = SizedBox(height: 40);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _back(context),
              _image(),
              _title(),
              _subTitle(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("New Password"),
                      gap,
                      _passwordField(),
                      gap2,
                      _label("Confirm New Password"),
                      gap,
                      _confirmPasswordField(),
                      gap3,
                      _saveButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // <--------- Widgets ------------->

  // back button
  Widget _back(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            Icon(
              IconlyLight.arrow_left,
              color: Colors.black54,
            ),
            SizedBox(width: 10),
            Text(
              "Back",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  // image widget
  Widget _image() {
    return Image.asset(
      "assets/security.png",
      width: 300,
    );
  }

  // title widget
  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "Reset Password?",
        style: GoogleFonts.poppins(
            fontSize: 25, fontWeight: FontWeight.w600, color: black),
      ),
    );
  }

  // subtitle widget
  Widget _subTitle() {
    return const Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text("Please enter new Password"),
    );
  }

  // label text widget
  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54),
    );
  }

  // new password widget
  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text("New Password"),
          hintText: "Enter New Password"),
    );
  }

  // confirm new password widget
  Widget _confirmPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text("New Password"),
          hintText: "Enter New Password"),
    );
  }

  // save button
  Widget _saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
      ),
      onPressed: () {},
      child: Text("Save"),
    );
  }
}
