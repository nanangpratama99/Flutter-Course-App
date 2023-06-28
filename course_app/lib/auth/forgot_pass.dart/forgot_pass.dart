import 'package:course_app/auth/forgot_pass.dart/reset_pass.dart';
import 'package:course_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                    child: _form(),
                  ),
                ),
              ],
            ),
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
      "assets/forgot.png",
      width: 300,
    );
  }

  // title widget
  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "Forgot Password?",
        style: GoogleFonts.poppins(
            fontSize: 25, fontWeight: FontWeight.w600, color: black),
      ),
    );
  }

  // subtitle widget
  Widget _subTitle() {
    return const Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text("Don't worry! input your email for reset password"),
    );
  }

  // form widget
  Widget _form() {
    const SizedBox gap = SizedBox(
      height: 10,
    );
    const SizedBox gap2 = SizedBox(
      height: 20,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Email Address"),
        gap,
        _emailField(),
        gap2,
        _label("OTP Code"),
        gap,
        _otpField(),
        gap2,
        // button
        _sentButton(),
      ],
    );
  }

  // label widget
  Widget _label(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
    );
  }

  // email field widget
  Widget _emailField() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Email"),
                hintText: 'Enter Email'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              elevation: 0,
              backgroundColor: blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Icon(IconlyLight.arrow_right),
          ),
        ),
      ],
    );
  }

  // otp field widget
  Widget _otpField() {
    return OTPTextField(
      contentPadding: EdgeInsets.symmetric(vertical: 20),
      length: 5,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 60,
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 15,
      style: TextStyle(fontSize: 17),
      onChanged: (pin) {
        print("Changed: " + pin);
      },
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  // sent button widget
  Widget _sentButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
      },
      child: Text("Sent"),
    );
  }
}
