import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_health_care_app/constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: kMainColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kMainWhite,
                    ),
                    child: Icon(Icons.person, size: 100, color: kMainColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Nipuna Madhuranga",
                    style: TextStyle(
                      color: kMainWhite,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //age of the user
                        "23 yrs",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 10),

                      Text(
                        " | ",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10),

                      //gender of the user
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 12,
                          color: kMainWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(kMainPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "6",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
