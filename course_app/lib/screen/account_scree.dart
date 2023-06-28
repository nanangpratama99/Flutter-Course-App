import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

import '../constant/constant.dart';
import '../welcome.dart';
import 'home/home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // sized
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  width: screenWidth,
                  child: Column(
                    children: [
                      _tittle(),
                      _avatar(),
                      _name(),
                      _listMenu(context),
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

  // Widgets --------------->

  // title widget
  Widget _tittle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "My Profile",
          style: GoogleFonts.poppins(
              fontSize: 25, fontWeight: FontWeight.w600, color: black),
        ),
      ],
    );
  }

  Widget _name() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Adam Safa'at",
            style: GoogleFonts.poppins(
                fontSize: 25, fontWeight: FontWeight.normal, color: black),
          ),
        ],
      ),
    );
  }

  // avatar picture
  Widget _avatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 60, right: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            IconlyLight.camera,
            size: 30,
          ),
          CircleAvatar(
            radius: 74,
            backgroundColor: primColor,
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'assets/suzume.jpg',
              ),
            ),
          ),
          const Icon(
            IconlyLight.delete,
            size: 30,
          ),
        ],
      ),
    );
  }

  // list menu
  Widget _listMenu(BuildContext context) {
    final List<Menu> menuData = [
      Menu(icon: Ionicons.person, name: 'My Account'),
      Menu(icon: IconlyBold.activity, name: 'Subscription'),
      Menu(icon: IconlyBold.wallet, name: 'Payment'),
      Menu(icon: IconlyBold.document, name: 'Certificate'),
      Menu(icon: IconlyBold.logout, name: 'Logout'),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: menuData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (menuData[index].name == 'Logout') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(menuData[index].icon),
                title: Text(menuData[index].name),
                iconColor: black,
                textColor: black.withOpacity(0.5),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class menu
class Menu {
  final IconData icon;
  final String name;

  Menu({required this.icon, required this.name});
}
