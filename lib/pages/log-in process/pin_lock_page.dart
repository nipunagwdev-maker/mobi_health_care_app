import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/log-in%20process/main_navigation.dart';

class PinLockPage extends StatefulWidget {
  const PinLockPage({super.key});

  @override
  State<PinLockPage> createState() => _PinLockPageState();
}

class _PinLockPageState extends State<PinLockPage> {
  String enteredPin = "";
  String userName = "";
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "";
    });
  }

  Future<void> checkPin() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPin = prefs.getString('userPin') ?? "";

    if (enteredPin == savedPin) {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainNavigation()),
        (route) => false,
      );
    } else {
      setState(() {
        errorMessage = "Incorrect PIN, try again";
        enteredPin = "";
      });
    }
  }

  void onNumberTap(String number) {
    if (enteredPin.length < 4) {
      setState(() {
        enteredPin += number;
        errorMessage = "";
      });
    }
    if (enteredPin.length == 4) {
      checkPin();
    }
  }

  void onBackspace() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: kMainWhite.withAlpha(180),
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: kMainPadding),
                  Icon(Icons.favorite, size: 22, color: kMainRedColor),
                ],
              ),
              Text(
                userName,
                style: TextStyle(
                  color: kMainWhite,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  bool filled = index < enteredPin.length;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: filled ? kMainWhite : kMainWhite.withAlpha(60),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 12),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
              const SizedBox(height: 30),

              _buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    final numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1.8,
          children: numbers.map((num) => _numberButton(num)).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 80),
            _numberButton("0"),
            SizedBox(
              width: 80,
              child: IconButton(
                onPressed: onBackspace,
                icon: Icon(Icons.backspace_outlined, color: kMainWhite),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _numberButton(String number) {
    return InkWell(
      onTap: () => onNumberTap(number),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: kMainWhite,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
