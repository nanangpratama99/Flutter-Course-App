import 'package:course_app/screen/account_scree.dart';
import 'package:course_app/screen/course/course_screen.dart';
import 'package:course_app/screen/home/home_screen.dart';
import 'package:course_app/screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'constant/constant.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // list screen page
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SettingScreen(),
      const CourseScreen(),
      const AccountScreen(),
    ];
  }

  // list button nav bar
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(IconlyLight.home),
        title: ("Home"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: black.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyLight.star),
        title: ("Newest"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: black.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.book),
        title: ("Course"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: black.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Ionicons.person_outline),
        title: ("Account"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: black.withOpacity(0.5),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
