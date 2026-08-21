import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/log-in%20process/setup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/lg.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                //Icon(Icons.medication_rounded, size: 70, color: kMainWhite),
                //const SizedBox(height: 20),
                Text(
                  "Welcome to MediTime",
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Your personal medicine Reminder,\nBuilt to help you stay on track",
                  style: TextStyle(
                    color: kMainColor.withAlpha(180),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetupPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMainColor,
                      foregroundColor: kMainWhite,
                      padding: const EdgeInsets.symmetric(
                        vertical: kMainPadding * 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
