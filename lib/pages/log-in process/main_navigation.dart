import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/add_medicine_page.dart';
import 'package:mobi_health_care_app/pages/home_page.dart';
import 'package:mobi_health_care_app/pages/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomePage(), AddMedicinePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMainColor,
        unselectedItemColor: kwidghtBgColor,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled, size: 30),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill, size: 30),
            label: "Profie",
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
