import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobi_health_care_app/data/user_data.dart';
import 'package:mobi_health_care_app/pages/services/noti_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobi_health_care_app/constants/colors.dart';
import 'package:mobi_health_care_app/pages/log-in%20process/welcome_page.dart';
import 'package:mobi_health_care_app/pages/log-in%20process/pin_lock_page.dart';

void main() {
  //notifications code line goes here
  WidgetsFlutterBinding.ensureInitialized();

  //initialize notifications
  NotiService().initNotification();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkIfSetupDone() async {
    final prefs = await SharedPreferences.getInstance();
    final setupDone = prefs.getBool('hasCompletedSetup') ?? false;

    if (setupDone) {
      await loadUserFromPrefs(); // 👈 ADD THIS
    }

    return setupDone;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobile-Health Care App by Nipuna",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 237, 237, 237),
        primaryColor: kMainColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: FutureBuilder<bool>(
        future: checkIfSetupDone(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: kMainColor,
              body: Center(child: CircularProgressIndicator(color: kMainWhite)),
            );
          }

          final setupDone = snapshot.data ?? false;
          return setupDone ? PinLockPage() : WelcomePage();
        },
      ),
    );
  }
}
