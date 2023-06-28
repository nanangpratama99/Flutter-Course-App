import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constant/constant.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                _appbar(),
                _submenu(),
              ],
            ),
            Positioned(
              top: 130,
              right: 10,
              left: 10,
              child: _banner(),
            ),
            Positioned(
              top: 145,
              right: 30,
              child: _svg(),
            ),
            Positioned(
              top: 360,
              right: 10,
              left: 10,
              bottom: 10, // Mengatur posisi ke bagian bawah
              child: SingleChildScrollView(
                // Menggunakan SingleChildScrollView di sini
                child: _listCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // widgets

  Widget _listCard() {
    List<String> title = [
      "Fullstack\nDevelopper",
      "Mobile Developper",
      "Frontend VueJs",
      "React Native",
      "Laravel",
      "Big Data",
    ];
    List<String> subTitle = [
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\n",
    ];
    List<String> image = [
      "assets/svg/developer.svg",
      "assets/svg/flutter-dev.svg",
      "assets/svg/nuxjs.svg",
      "assets/svg/react-dev.svg",
      "assets/svg/laravel-vue.svg",
      "assets/svg/server.svg",
    ];

    List<Color> color = [
      color1,
      flutterColor,
      vueColor1,
      blue,
      laravelColor,
      primColor,
    ];

    return Column(
      children: List.generate(title.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: color[index],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: SvgPicture.asset(
                  image[index],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title[index],
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subTitle[index],
                    style: GoogleFonts.poppins(color: Colors.white54),
                  ),
                  _progresIndicator(),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  // linear progres indicator
  Widget _progresIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Completed 50%",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        LinearPercentIndicator(
            width: 200.0,
            lineHeight: 8.0,
            percent: 0.5,
            addAutomaticKeepAlive: true,
            animateFromLastPercent: true,
            animationDuration: 1,
            barRadius: Radius.circular(20),
            backgroundColor: Colors.white,
            padding: EdgeInsets.only(right: 10),
            progressColor: Colors.amberAccent),
      ],
    );
  }

  // svg
  Widget _svg() {
    const String assetName = 'assets/svg/social.svg';
    return SvgPicture.asset(
      assetName,
      height: 150,
      width: 150,
      fit: BoxFit.scaleDown,
    );
  }

  // appbar
  Widget _appbar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            IconlyLight.arrow_left,
            color: black,
          ),
          Text(
            "My Course",
            style: GoogleFonts.poppins(
                color: black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Icon(
            IconlyLight.search,
            color: black,
          ),
        ],
      ),
    );
  }

  // sub menu
  Widget _submenu() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _iconMenu("All", Colors.blueAccent, IconlyLight.document, white,
              Colors.grey, white),
          _iconMenu(
              "On Going",
              Colors.blue.withOpacity(0.1),
              Icons.local_fire_department_outlined,
              Colors.orangeAccent,
              Colors.white,
              black),
          _iconMenu("Complete", Colors.blue.withOpacity(0.1), Icons.checklist,
              Colors.greenAccent, Colors.white, black),
          _iconMenu("Un Finish", Colors.blue.withOpacity(0.1), Icons.abc,
              Colors.purpleAccent, Colors.white, black),
        ],
      ),
    );
  }

  Widget _iconMenu(String text, Color color, IconData icon, Color color2,
      Color color3, Color textColor) {
    return Container(
      width: 150,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              icon,
              color: color3,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
                color: textColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // banner
  Widget _banner() {
    String title = "Find a course you\nwant to learn !";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  backgroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                "Check Now",
                style: GoogleFonts.poppins(color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
