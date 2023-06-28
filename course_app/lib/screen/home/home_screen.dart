import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

import '../../constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: _appbar(),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _search(
                    "Search",
                    IconlyBold.search,
                    IconlyLight.filter,
                  ),
                  _title(),
                  _listMenu(),
                  _courseCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // appbar
  Widget _appbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Helo"),
              Text(
                "Adam Safa'at",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: black2,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: seconColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.person_2_rounded,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // search
  Widget _search(String hint, IconData sufix, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                hintText: hint,
                suffixIcon: Icon(
                  sufix,
                  color: blue,
                  size: 30,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  // title
  Widget _title() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30),
      child: Text(
        "Category",
        style: GoogleFonts.poppins(
            fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }

  // submenu
  Widget _listMenu() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _menu("All Topic", Icons.local_fire_department_outlined,
                  Colors.white, Colors.blue, blue, white),
              _menu("Newest", Icons.new_releases_outlined, purple, white, white,
                  black),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _menu("Saved", Icons.bookmark, Colors.orangeAccent, white, white,
                  black),
              _menu("Recomend", Icons.star, Colors.green, white, white, black),
            ],
          )
        ],
      ),
    );
  }

  // menu
  Widget _menu(String title, IconData icon, Color color, Color color2,
      Color color3, Color color4) {
    return Container(
      width: 180,
      height: 60,
      decoration: BoxDecoration(
          color: color3,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0, 5))
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: color2,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(color: color4),
          )
        ],
      ),
    );
  }

  // Course Card
  Widget _courseCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _listCard(Colors.orangeAccent, "assets/1.png", context,
              "Web Development", "Created by Course Academy"),
          _listCard(Colors.blueAccent, "assets/fullstack.png", context,
              "Full Stack", "Created by Course Academy"),
          _listCard(Colors.greenAccent, "assets/data-analytic.png", context,
              "Data Analytic", "Created by Course Academy"),
        ],
      ),
    );
  }

  // list card
  Widget _listCard(
      Color color, String image, context, String title, String subTitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // padding: EdgeInsets.only(left: 5, right: 5, top: 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 25,
              spreadRadius: 2,
              offset: Offset(0, 0))
        ],
      ),
      height: 330,
      width: 250,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              _titleCard(title, subTitle),
              SizedBox(height: 7),
              _infoCourse(),
            ],
          ),
          const Positioned(
            left: 210,
            top: 10,
            child: Icon(
              Ionicons.bookmark,
              size: 28,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }

  // title
  Widget _titleCard(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                color: white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(color: white, fontSize: 10),
          ),
        ],
      ),
    );
  }

  // info course
  Widget _infoCourse() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Ionicons.document,
                    size: 20,
                    color: white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "20 Video",
                    style: GoogleFonts.poppins(color: Colors.white54),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Ionicons.time,
                    size: 20,
                    color: white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Minutes",
                    style: GoogleFonts.poppins(color: Colors.white54),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
