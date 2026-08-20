import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/add_medicine_page.dart';
import 'package:mobi_health_care_app/pages/home_page.dart';
import 'package:mobi_health_care_app/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //making a index for the rendering pages' list
  int _currentIndex = 0;
  final List<Widget> _pages = [HomePage(), AddMedicinePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobile-Health Care App by Nipuna",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 237, 237, 237),
        primaryColor: kMainColor,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ), //it's a new font them called  'manrope'
      ),
      home: Scaffold(
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
      ),
    );
  }
}
